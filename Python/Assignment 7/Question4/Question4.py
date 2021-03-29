import matplotlib.pyplot as plt

sales_file = open("company_sales.tsv", "r")
data = sales_file.readlines()
months = []
total_profit = []

for line in data:
    if line.startswith("month_number"):
        continue
    line = line.strip()
    splitted_line = line.split("\t")
    months.append(int(splitted_line[0]))
    total_profit.append(int(splitted_line[-1]))

sales_file.close()
plt.plot(months, total_profit)
plt.xticks(months)
plt.yticks([100000, 200000, 300000, 400000, 500000])
plt.xlabel("Month Number")
plt.ylabel("Total Profit")
plt.title("Company profit per month")
plt.show()
