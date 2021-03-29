import numpy as np
from bbox import BBox2DList

def nms(bbl: BBox2DList, scores: np.ndarray, thresh):
    """
    Perform fast non-maximum suppression on a set of bounding boxes \
        given their associated confidences.

    Args:
        bbl (:py:class:`BBox2DList`): List of 2D bounding boxes.
        scores (:py:class:`list` or :py:class:`ndarray`): Scores for each bounding box.

    Raises:
        ValueError: If arguments are of incorrect type or size.
    """
    if bbl.shape[0] == 0:
        return np.array([]).astype(np.int)

    if not isinstance(scores, (list, np.ndarray)):
        raise ValueError("`scores` should be a list or numpy array")

    # convert to numpy array if it is a list
    scores = np.asarray(scores)

    if not scores.shape[0] == bbl.shape[0]:
        raise ValueError("box list and scores should have the same number of elements.")

    areas = bbl.w * bbl.h
    order = scores.argsort()[::-1]

    keep = []
    while order.size > 0:
        i = order[0]
        keep.append(int(i))

        xx1 = np.maximum(bbl.x1[i], bbl.x1[order[1:]])
        yy1 = np.maximum(bbl.y1[i], bbl.y1[order[1:]])
        xx2 = np.minimum(bbl.x2[i], bbl.x2[order[1:]])
        yy2 = np.minimum(bbl.y2[i], bbl.y2[order[1:]])

        w = np.maximum(0.0, xx2 - xx1 + 1)
        h = np.maximum(0.0, yy2 - yy1 + 1)
        inter = w * h

        overlap = inter / (areas[i] + areas[order[1:]] - inter)

        idx = np.where(overlap <= thresh)[0]
        order = order[idx + 1]

    return np.array(keep).astype(np.int)