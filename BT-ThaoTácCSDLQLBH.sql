USE QuanLyBanHang;
#Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
SELECT oID, oDATE , oTotalPrice FROM Oder;
#Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
SELECT Cus.cName AS 'Tên Khách Hàng', pr.pName AS 'Tên sản phẩm'   FROM Customer AS Cus,Product AS pr, OrderDetail AS Ord, Oder As Od
WHERE Od.cID = Cus.cID AND Od.oID = Ord.oID;
#Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT cus.cName AS 'Khách hàng không mua' FROM Customer AS cus, Oder AS od
WHERE NOT cus.cID = od.cID;
#Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
