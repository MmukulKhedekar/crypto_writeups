from sage.all import *
from Cryptodome.Util.number import *

e = 3
C1 = 18800481586084054039791866260340290530753574096608981219676240952396581215405999322900721100010143358589565875849265244891390128879142073674638014692781954038221076142575211160056045982796570456403342235459993226189711527512562549524264843084507825543946345870421929944088320180203523639015697492701408889457323728338550507083486875200308148796204028203570173287676527573646603945419970064235111825693068356464405802301158513683267018997412021868567192325479277994301600670226202801507297712203287915189024886419741595336452702129004648312156111491929387084173480767829508241603972024562685845159300712087467222972414
C2 = 19375006589171030326270617776231319324969029997139315115971109313589384847707485912573635123105574546651501400856186750907392226426743246244844372523424939628305483513585296877402825398903499062054803711306626890999374850577720075170496140618617379075078391437704503410338992789043268728325948976627000155399277977268925034878255324440837146428195184999176537456410639262680328985352536726067199177612341409065569671215712743433744648762545218549706125273512202243892688650026737516892504551133680758510886374359545609402020273859001567227723040602078391881582529395269652598167994891548852568011906719668214126909718
n = 21978670871762945557634799190721314141794311091517242394558844124687851054277684977037028285786822192262995195418294773668940700468164482573543705594853486972766736778488106596396992068727783704724965242058757992489409567475726919993756608522406732756132040771825195203510136574018630806796666291202619128663626521114169177613809934932801796890467573044639957689104645015765413438097264364884918312631529069998729397206541065171048187371912170223579228639283775790801444836744079377468645817916865296038218066985848492440248584475887489111754378975909611961609948443207914186884037771474651660846036152336893402549599

# sage: def short_pad_attack(c1, c2, e, n):
#     PRxy.<x,y> = PolynomialRing(Zmod(n))
#     PRx.<xn> = PolynomialRing(Zmod(n))
#     PRZZ.<xz,yz> = PolynomialRing(Zmod(n))
#     g1 = x^e - c1
#     g2 = (x+y)^e - c2
#     q1 = g1.change_ring(PRZZ)
#     q2 = g2.change_ring(PRZZ)
#     h = q2.resultant(q1)
#     h = h.univariate_polynomial()
#     h = h.change_ring(PRx).subs(y=xn)
#     h = h.monic()
#     diff = h.small_roots(X=2**128, beta=0.3)[0]  # find root < 2^kbits with factor >= n^0.5
#     return diff
# sage: e = 3
# sage: C1 = 18800481586084054039791866260340290530753574096608981219676240952396581215405999322900721100010143358589565875849265244891390128879142073674638014692781954038221076142575211160056045982796570456403342235459993226189711527512562549524264843084507825543946345870421929944088320180203523639015697492701408889457323728338550507083486875200308148796204028203570173287676527573646603945419970064235111825693068356464405802301158513683267018997412021868567192325479277994301600670226202801507297712203287915189024886419741595336452702129004648312156111491929387084173480767829508241603972024562685845159300712087467222972414
# sage: C2 = 19375006589171030326270617776231319324969029997139315115971109313589384847707485912573635123105574546651501400856186750907392226426743246244844372523424939628305483513585296877402825398903499062054803711306626890999374850577720075170496140618617379075078391437704503410338992789043268728325948976627000155399277977268925034878255324440837146428195184999176537456410639262680328985352536726067199177612341409065569671215712743433744648762545218549706125273512202243892688650026737516892504551133680758510886374359545609402020273859001567227723040602078391881582529395269652598167994891548852568011906719668214126909718
# sage: n = 21978670871762945557634799190721314141794311091517242394558844124687851054277684977037028285786822192262995195418294773668940700468164482573543705594853486972766736778488106596396992068727783704724965242058757992489409567475726919993756608522406732756132040771825195203510136574018630806796666291202619128663626521114169177613809934932801796890467573044639957689104645015765413438097264364884918312631529069998729397206541065171048187371912170223579228639283775790801444836744079377468645817916865296038218066985848492440248584475887489111754378975909611961609948443207914186884037771474651660846036152336893402549599
# sage: diff = short_pad_attack(C1,C2,e,n)
# sage: print(diff)

# output: 21978670871762945557634799190721314141794311091517242394558844124687851054277684977037028285786822192262995195418294773668940700468164482573543705594853486972766736778488106596396992068727783704724965242058757992489409567475726919993756608522406732756132040771825195203510136574018630806796666291202619128663626521114169177613809934932801796890467573044639957689104645015765413438097264364884918312631529069998729397206541065171048187371912170223579228639283775790801444836744079377468645817916865296038218066985848492440248584475887489111754378975909611961609948443207914186883847205603555784402932177378485299990661
diff = 21978670871762945557634799190721314141794311091517242394558844124687851054277684977037028285786822192262995195418294773668940700468164482573543705594853486972766736778488106596396992068727783704724965242058757992489409567475726919993756608522406732756132040771825195203510136574018630806796666291202619128663626521114169177613809934932801796890467573044639957689104645015765413438097264364884918312631529069998729397206541065171048187371912170223579228639283775790801444836744079377468645817916865296038218066985848492440248584475887489111754378975909611961609948443207914186883847205603555784402932177378485299990661

def compositeModulusGCD(a, b):
    if(b == 0):
            return a.monic()
    else:
            return compositeModulusGCD(b, a % b)

def FranklinReiter(n, e, c1, c2, a1, a2, b1, b2):
    x = var('x')
    P = PolynomialRing(Zmod(n),'x')
    f = (a1*P('x')+b1)**e - c1
    g = (a2*P('x')+b2)**e - c2
    m =  Integer(n-(compositeModulusGCD(f,g)).coefficients()[0])
    return m

m = FranklinReiter(n, e, C1, C2, 1, 1, 0, diff)
M1 = long_to_bytes(m)
M2 = long_to_bytes(m+diff)
print(M1)