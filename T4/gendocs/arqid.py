import xml.etree.cElementTree as T

arv = T.parse('arq.xml')
raiz = arv.getroot()

i = 1
for elemento in raiz.findall('ARQELEM'):
	elemento.set('id', str(i))
	i = i+1

arv.write('arqid.xml')
