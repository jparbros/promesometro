# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup.id).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }].id)
#   Mayor.create(:name => 'Daley', :city => cities.first.id)

states = ['amazonas', 'ancash', 'apurimac', 'arequipa', 'ayacucho', 'cajamarca', 'callao', 'cusco', 'huancavelica', 'huanuco', 'ica', 'junin', 'la libertad', 'lambayeque', 'lima', 'loreto', 'madre de dios', 'moquegua', 'pasco', 'piura', 'puno', 'san martin', 'tacna', 'tumbes', 'ucayali']

states.each do |state|
  State.create(:name => state)
end
amazonas = State.find_by_name('amazonas')
Province.create(:name => 'chachapoyas', :state_id => amazonas.id)
Province.create(:name => 'bagua', :state_id => amazonas.id)
Province.create(:name => 'bongara', :state_id => amazonas.id)
Province.create(:name => 'condorcanqui', :state_id => amazonas.id)
Province.create(:name => 'luya', :state_id => amazonas.id)
Province.create(:name => 'rodriguez de mendoza', :state_id => amazonas.id)
Province.create(:name => 'utcubamba', :state_id => amazonas.id)

ancash = State.find_by_name('ancash')
Province.create(:name => 'huaraz', :state_id => ancash.id)
Province.create(:name => 'aija', :state_id => ancash.id)
Province.create(:name => 'antonio raymondi', :state_id => ancash.id)
Province.create(:name => 'asuncion', :state_id => ancash.id)
Province.create(:name => 'bolognesi', :state_id => ancash.id)
Province.create(:name => 'carhuaz', :state_id => ancash.id)
Province.create(:name => 'carlos fermin fitzcarrald', :state_id => ancash.id)
Province.create(:name => 'casma', :state_id => ancash.id)
Province.create(:name => 'corongo', :state_id => ancash.id)
Province.create(:name => 'huari', :state_id => ancash.id)
Province.create(:name => 'huarmey', :state_id => ancash.id)
Province.create(:name => 'huaylas', :state_id => ancash.id)
Province.create(:name => 'mariscal luzuriaga', :state_id => ancash.id)
Province.create(:name => 'ocros', :state_id => ancash.id)
Province.create(:name => 'pallasca', :state_id => ancash.id)
Province.create(:name => 'pomabamba', :state_id => ancash.id)
Province.create(:name => 'recuay', :state_id => ancash.id)
Province.create(:name => 'santa', :state_id => ancash.id)
Province.create(:name => 'sihuas', :state_id => ancash.id)
Province.create(:name => 'yungay', :state_id => ancash.id)

apurimac = State.find_by_name('apurimac')
Province.create(:name => 'abancay', :state_id => apurimac.id)
Province.create(:name => 'antabamba', :state_id => apurimac.id)
Province.create(:name => 'aymaraes', :state_id => apurimac.id)
Province.create(:name => 'cotabambas', :state_id => apurimac.id)
Province.create(:name => 'grau', :state_id => apurimac.id)
Province.create(:name => 'chincheros', :state_id => apurimac.id)
Province.create(:name => 'andahuaylas', :state_id => apurimac.id)

arequipa = State.find_by_name('arequipa')
Province.create(:name => 'arequipa', :state_id => arequipa.id)
Province.create(:name => 'camana', :state_id => arequipa.id)
Province.create(:name => 'caraveli', :state_id => arequipa.id)
Province.create(:name => 'castilla', :state_id => arequipa.id)
Province.create(:name => 'caylloma', :state_id => arequipa.id)
Province.create(:name => 'condesuyos', :state_id => arequipa.id)
Province.create(:name => 'islay', :state_id => arequipa.id)
Province.create(:name => 'la union', :state_id => arequipa.id)

ayacucho = State.find_by_name('ayacucho')
Province.create(:name => 'cangallo', :state_id => ayacucho.id)
Province.create(:name => 'huanta', :state_id => ayacucho.id)
Province.create(:name => 'huamanga', :state_id => ayacucho.id)
Province.create(:name => 'huancasancos', :state_id => ayacucho.id)
Province.create(:name => 'la mar', :state_id => ayacucho.id)
Province.create(:name => 'lucanas', :state_id => ayacucho.id)
Province.create(:name => 'parinacochas', :state_id => ayacucho.id)
Province.create(:name => 'paucar del sara sara', :state_id => ayacucho.id)
Province.create(:name => 'sucre', :state_id => ayacucho.id)
Province.create(:name => 'victor fajardo', :state_id => ayacucho.id)
Province.create(:name => 'vilcas huaman', :state_id => ayacucho.id)

cajamarca = State.find_by_name('cajamarca')
Province.create(:name => 'san ignacio', :state_id => cajamarca.id)
Province.create(:name => 'jaen', :state_id => cajamarca.id)
Province.create(:name => 'cutervo', :state_id => cajamarca.id)
Province.create(:name => 'chota', :state_id => cajamarca.id)
Province.create(:name => 'santa cruz', :state_id => cajamarca.id)
Province.create(:name => 'hualgayoc', :state_id => cajamarca.id)
Province.create(:name => 'celendin', :state_id => cajamarca.id)
Province.create(:name => 'san miguel', :state_id => cajamarca.id)
Province.create(:name => 'san pablo', :state_id => cajamarca.id)
Province.create(:name => 'cajamarca', :state_id => cajamarca.id)
Province.create(:name => 'contumaza', :state_id => cajamarca.id)
Province.create(:name => 'cajabamba', :state_id => cajamarca.id)
Province.create(:name => 'san marcos', :state_id => cajamarca.id)

callao = State.find_by_name('callao')
Province.create(:name => 'callao', :state_id => callao.id)

cusco = State.find_by_name('cusco')
Province.create(:name => 'cuzco', :state_id => cusco.id)
Province.create(:name => 'acomayo', :state_id => cusco.id)
Province.create(:name => 'anta', :state_id => cusco.id)
Province.create(:name => 'calca', :state_id => cusco.id)
Province.create(:name => 'canas', :state_id => cusco.id)
Province.create(:name => 'canchis', :state_id => cusco.id)
Province.create(:name => 'chumbivilcas', :state_id => cusco.id)
Province.create(:name => 'espinar', :state_id => cusco.id)
Province.create(:name => 'la convencion', :state_id => cusco.id)
Province.create(:name => 'paruro', :state_id => cusco.id)
Province.create(:name => 'paucartambo', :state_id => cusco.id)
Province.create(:name => 'quispicanchi', :state_id => cusco.id)
Province.create(:name => 'urubamba', :state_id => cusco.id)

huancavelica = State.find_by_name('huancavelica')
Province.create(:name => 'huancavelica', :state_id => huancavelica.id)
Province.create(:name => 'acobamba', :state_id => huancavelica.id)
Province.create(:name => 'angaraes', :state_id => huancavelica.id)
Province.create(:name => 'castrovirreyna', :state_id => huancavelica.id)
Province.create(:name => 'churcampa', :state_id => huancavelica.id)
Province.create(:name => 'huaytara', :state_id => huancavelica.id)
Province.create(:name => 'tayacaja', :state_id => huancavelica.id)

huanuco = State.find_by_name('huanuco')
Province.create(:name => 'huanuco', :state_id => huanuco.id)
Province.create(:name => 'ambo', :state_id => huanuco.id)
Province.create(:name => 'dos de mayo', :state_id => huanuco.id)
Province.create(:name => 'huacaybamba', :state_id => huanuco.id)
Province.create(:name => 'huamalies', :state_id => huanuco.id)
Province.create(:name => 'leoncio prado', :state_id => huanuco.id)
Province.create(:name => 'marañon', :state_id => huanuco.id)
Province.create(:name => 'pachitea', :state_id => huanuco.id)
Province.create(:name => 'puerto inca', :state_id => huanuco.id)
Province.create(:name => 'lauricocha', :state_id => huanuco.id)
Province.create(:name => 'yarowilca', :state_id => huanuco.id)

ica = State.find_by_name('ica')
Province.create(:name => 'ica', :state_id => ica.id)
Province.create(:name => 'chincha', :state_id => ica.id)
Province.create(:name => 'nazca', :state_id => ica.id)
Province.create(:name => 'palpa', :state_id => ica.id)
Province.create(:name => 'pisco', :state_id => ica.id)

junin = State.find_by_name('junin')
Province.create(:name => 'huancayo', :state_id => junin.id)
Province.create(:name => 'concepcion', :state_id => junin.id)
Province.create(:name => 'chanchamayo', :state_id => junin.id)
Province.create(:name => 'jauja', :state_id => junin.id)
Province.create(:name => 'junin', :state_id => junin.id)
Province.create(:name => 'satipo', :state_id => junin.id)
Province.create(:name => 'tarma', :state_id => junin.id)
Province.create(:name => 'yauli', :state_id => junin.id)
Province.create(:name => 'chupaca', :state_id => junin.id)

la_libertad = State.find_by_name('la libertad')
Province.create(:name => 'trujillo', :state_id => la_libertad.id)
Province.create(:name => 'ascope', :state_id => la_libertad.id)
Province.create(:name => 'bolivar', :state_id => la_libertad.id)
Province.create(:name => 'chepen', :state_id => la_libertad.id)
Province.create(:name => 'julcan', :state_id => la_libertad.id)
Province.create(:name => 'otuzco', :state_id => la_libertad.id)
Province.create(:name => 'pacasmayo', :state_id => la_libertad.id)
Province.create(:name => 'pataz', :state_id => la_libertad.id)
Province.create(:name => 'sanchez carrion', :state_id => la_libertad.id)
Province.create(:name => 'santiago de chuco', :state_id => la_libertad.id)
Province.create(:name => 'gran chimu', :state_id => la_libertad.id)
Province.create(:name => 'viru', :state_id => la_libertad.id)

lambayeque = State.find_by_name('lambayeque')
Province.create(:name => 'chiclayo', :state_id => lambayeque.id)
Province.create(:name => 'ferreñafe', :state_id => lambayeque.id)
Province.create(:name => 'lambayeque', :state_id => lambayeque.id)

lima = State.find_by_name('lima')
Province.create(:name => 'lima', :state_id => lima.id)
Province.create(:name => 'barranca', :state_id => lima.id)
Province.create(:name => 'cajatambo', :state_id => lima.id)
Province.create(:name => 'canta', :state_id => lima.id)
Province.create(:name => 'cañete', :state_id => lima.id)
Province.create(:name => 'huaral', :state_id => lima.id)
Province.create(:name => 'huarochiri', :state_id => lima.id)
Province.create(:name => 'huaura', :state_id => lima.id)
Province.create(:name => 'oyon', :state_id => lima.id)
Province.create(:name => 'yauyos', :state_id => lima.id)

loreto = State.find_by_name('loreto')
Province.create(:name => 'maynas', :state_id => loreto.id)
Province.create(:name => 'alto amazonas', :state_id => loreto.id)
Province.create(:name => 'loreto', :state_id => loreto.id)
Province.create(:name => 'mariscal ramon castilla', :state_id => loreto.id)
Province.create(:name => 'requena', :state_id => loreto.id)
Province.create(:name => 'ucayali', :state_id => loreto.id)
Province.create(:name => 'datem del marañon', :state_id => loreto.id)

madre_de_dios = State.find_by_name('madre de dios')
Province.create(:name => 'tambopata', :state_id => madre_de_dios.id)
Province.create(:name => 'manu', :state_id => madre_de_dios.id)
Province.create(:name => 'tahuamanu', :state_id => madre_de_dios.id)

moquegua = State.find_by_name('moquegua')
Province.create(:name => 'mariscal nieto', :state_id => moquegua.id)
Province.create(:name => 'general sanchez cerro', :state_id => moquegua.id)
Province.create(:name => 'ilo', :state_id => moquegua.id)

pasco = State.find_by_name('pasco')
Province.create(:name => 'pasco', :state_id => pasco.id)
Province.create(:name => 'daniel alcides carrion', :state_id => pasco.id)
Province.create(:name => 'oxapampa', :state_id => pasco.id)

piura = State.find_by_name('piura')
Province.create(:name => 'piura', :state_id => piura.id)
Province.create(:name => 'ayabaca', :state_id => piura.id)
Province.create(:name => 'huancabamba', :state_id => piura.id)
Province.create(:name => 'morropon', :state_id => piura.id)
Province.create(:name => 'paita', :state_id => piura.id)
Province.create(:name => 'sullana', :state_id => piura.id)
Province.create(:name => 'talara', :state_id => piura.id)
Province.create(:name => 'sechura', :state_id => piura.id)

puno = State.find_by_name('puno')
Province.create(:name => 'puno', :state_id => puno.id)
Province.create(:name => 'azangaro', :state_id => puno.id)
Province.create(:name => 'carabaya', :state_id => puno.id)
Province.create(:name => 'chucuito', :state_id => puno.id)
Province.create(:name => 'el collao', :state_id => puno.id)
Province.create(:name => 'huancane', :state_id => puno.id)
Province.create(:name => 'lampa', :state_id => puno.id)
Province.create(:name => 'melgar', :state_id => puno.id)
Province.create(:name => 'moho', :state_id => puno.id)
Province.create(:name => 'san antonio de putina', :state_id => puno.id)
Province.create(:name => 'san roman', :state_id => puno.id)
Province.create(:name => 'sandia', :state_id => puno.id)
Province.create(:name => 'yunguyo', :state_id => puno.id)

san_martin = State.find_by_name('san martin')
Province.create(:name => 'moyobamba', :state_id => san_martin.id)
Province.create(:name => 'bellavista', :state_id => san_martin.id)
Province.create(:name => 'el dorado', :state_id => san_martin.id)
Province.create(:name => 'huallaga', :state_id => san_martin.id)
Province.create(:name => 'lamas', :state_id => san_martin.id)
Province.create(:name => 'mariscal caceres', :state_id => san_martin.id)
Province.create(:name => 'picota', :state_id => san_martin.id)
Province.create(:name => 'rioja', :state_id => san_martin.id)
Province.create(:name => 'san martin', :state_id => san_martin.id)
Province.create(:name => 'tocache', :state_id => san_martin.id)

tacna = State.find_by_name('tacna')
Province.create(:name => 'tacna', :state_id => tacna.id)
Province.create(:name => 'candarave', :state_id => tacna.id)
Province.create(:name => 'jorge basadre', :state_id => tacna.id)
Province.create(:name => 'tarata', :state_id => tacna.id)

tumbes = State.find_by_name('tumbes')
Province.create(:name => 'tumbes', :state_id => tumbes.id)
Province.create(:name => 'contralmirante villar', :state_id => tumbes.id)
Province.create(:name => 'zarumilla', :state_id => tumbes.id)

ucayali = State.find_by_name('ucayali')
Province.create(:name => 'coronel portillo', :state_id => ucayali.id)
Province.create(:name => 'atalaya', :state_id => ucayali.id)
Province.create(:name => 'padre abad', :state_id => ucayali.id)
Province.create(:name => 'purus', :state_id => ucayali.id)

topics = ['abasto', 'acceso a la informacion', 'agricultura', 'asistencia social', 'desarrollo municipal', 'desarrollo rural', 'desarrollo social', 'educacion', 'energia', 'equidad de genero', 'evaluacion', 'fiscalizacion', 'impuestos', 'infraestructura', 'ingresos', 'justicia', 'labor legislativa', 'migracion', 'participacion ciudadana', 'pensiones', 'profesionalizacion', 'publicidad electoral', 'publicidad oficial', 'quejas', 'regulacion', 'rendicion de cuentas', 'salud publica', 'seguridad publica', 'seguridad social', 'servicios', 'sociedad civil', 'transparencia', 'violencia de genero']

topics.each_with_index do |topic,index|
  Topic.create(:name => topic, :position => index)
end

political_party = PoliticalParty.create(:name => 'Accion Popular')
political_party.logo = File.open('doc/partidos/accion_popular.gif')
political_party.save
political_party = PoliticalParty.create(:name => 'Agrupacion Independiente Si Cumple')
political_party.logo = File.open('doc/partidos/agrupacion_independiente_si_cumple.jpg')
political_party.save
political_party = PoliticalParty.create(:name => 'Alianza para el Progreso')
political_party.logo = File.open('doc/partidos/alianza_para_el_progreso.png')
political_party.save
political_party = PoliticalParty.create(:name => 'Cambio 90')
political_party.logo = File.open('doc/partidos/cambio_90.jpeg')
political_party.save
political_party = PoliticalParty.create(:name => 'Cambio Radical')
political_party.logo = File.open('doc/partidos/cambio_radical.jpeg')
political_party.save
political_party = PoliticalParty.create(:name => 'Despertar Nacional')
political_party.logo = File.open('doc/partidos/despertar_nacional.jpeg')
political_party.save
political_party = PoliticalParty.create(:name => 'Fonavistas del Peru')
political_party.logo = File.open('doc/partidos/fonavistas_del_peru.jpeg')
political_party.save
political_party = PoliticalParty.create(:name => 'Fuerza 2011')
political_party.logo = File.open('doc/partidos/fuerza_2011.jpeg')
political_party.save
political_party = PoliticalParty.create(:name => 'Fuerza Nacional')
political_party.logo = File.open('doc/partidos/fuerza_nacional.jpeg')
political_party.save
political_party = PoliticalParty.create(:name => 'Participacion Popular')
political_party.logo = File.open('doc/partidos/participacion_popular.jpeg')
political_party.save
political_party = PoliticalParty.create(:name => 'Partido Aprista Peruano')
political_party.logo = File.open('doc/partidos/partido_aprista_peruano.png')
political_party.save
political_party = PoliticalParty.create(:name => 'Partido Democratico Somos Peru')
political_party.logo = File.open('doc/partidos/partido_democratico_somos_peru.jpeg')
political_party.save
political_party = PoliticalParty.create(:name => 'Partido Humanista Peruano')
political_party.logo = File.open('doc/partidos/partido_humanista_peruano.jpeg')
political_party.save
political_party = PoliticalParty.create(:name => 'Partido Politico Adelante')
political_party.logo = File.open('doc/partidos/partido_politico_adelante.jpeg')
political_party.save
political_party = PoliticalParty.create(:name => 'Partido Popular Cristiano')
political_party.logo = File.open('doc/partidos/partido_popular_cristiano.jpg')
political_party.save
political_party = PoliticalParty.create(:name => 'Peru Posible')
political_party.logo = File.open('doc/partidos/peru_posible.jpeg')
political_party.save
political_party = PoliticalParty.create(:name => 'Renovacion Nacional')
political_party.logo = File.open('doc/partidos/renovacion_nacional.jpeg')
political_party.save
political_party = PoliticalParty.create(:name => 'Restauracion Nacional')
political_party.logo = File.open('doc/partidos/restauracion_social.jpg')
political_party.save
political_party = PoliticalParty.create(:name => 'Siempre Unidos')
political_party.logo = File.open('doc/partidos/siempres_unidos.jpeg')
political_party.save
political_party = PoliticalParty.create(:name => 'Solidaridad Nacional')
political_party.logo = File.open('doc/partidos/solidaridad_nacional.jpg')
political_party.save
political_party = PoliticalParty.create(:name => 'Union por el Peru')
political_party.logo = File.open('doc/partidos/union_por_el_peru.jpeg')
political_party.save
political_party = PoliticalParty.create(:name => 'Movimiento Nueva Izquierda')
political_party.logo = File.open('doc/partidos/movimiento_nueva_izquierda.jpeg')
political_party.save
political_party = PoliticalParty.create(:name => 'Todos por el Peru')
political_party.logo = File.open('doc/partidos/todos_por_el_peru.jpeg')
political_party.save
political_party = PoliticalParty.create(:name => 'Frente Popular Agricola Fia del Peru')
political_party.logo = File.open('doc/partidos/frente_popular_agricola_la_fia_del_peru.jpeg')
political_party.save
political_party = PoliticalParty.create(:name => 'Partido Descentralista Fuerza Social')
political_party.logo = File.open('doc/partidos/partido_descentralista_fuerza_social.jpg')
political_party.save
political_party = PoliticalParty.create(:name => 'Gana Peru')
political_party.logo = File.open('doc/partidos/gana_peru.jpeg')
political_party.save
political_party = PoliticalParty.create(:name => 'Justicia, Tecnologia, Ecologia')
political_party.logo = File.open('doc/partidos/justicia_tecnologia_ecologia.jpeg')
political_party.save
political_party = PoliticalParty.create(:name => 'Movimiento Regional De Las Manos Limpias')
political_party.remote_logo_url = 'http://www.eleccionesenperu.com/img/movimiento-regional/lambayeque/SIMBOLO-LOGO-MOVIMIENTO-REGIONAL-DE-LAS-MANOS-LIMPIAS.jpg'
political_party.save
political_party = PoliticalParty.create(:name => 'Movimiento Regional Accion Regional')
political_party.remote_logo_url = 'http://www.eleccionesenperu.com/img/movimiento-regional/piura/SIMBOLO-LOGO-MOVIMIENTO-ACCION-REGIONAL.jpg'
political_party.save
political_party = PoliticalParty.create(:name => 'Movimiento Regional Nueva Amazonia')
political_party.remote_logo_url = 'http://www.eleccionesenperu.com/img/movimiento-regional/san-martin/SIMBOLO-LOGO-NUEVA-AMAZONIA.jpg'
political_party.save
political_party = PoliticalParty.create(:name => 'Movimiento Regional Fuerza Comunal')
political_party.remote_logo_url = 'http://www.eleccionesenperu.com/img/movimiento-regional/san-martin/SIMBOLO-LOGO-FUERZA-COMUNAL.jpg'
political_party.save
political_party = PoliticalParty.create(:name => 'Gran Alianza Nacionalista Cusco')
political_party.remote_logo_url = 'http://www.infogob.com.pe/Partido/ImgHandler.ashx?imgid=2092'
political_party.save
political_party = PoliticalParty.create(:name => 'Movimiento Regional Patria Arriba Perú Adelante')
political_party.remote_logo_url = 'http://www.eleccionesenperu.com/img/movimiento-regional/cusco/SIMBOLO-LOGO-PATRIA-ARRIBA-PERU-ADELANTE.jpg'
political_party.save
political_party = PoliticalParty.create(:name => 'Movimiento Regional Pan')
political_party.remote_logo_url = 'http://www.eleccionesenperu.com/img/movimiento-regional/cusco/SIMBOLO-LOGO-MOVIMIENTO-REGIONAL-PAN.jpg'
political_party.save
political_party = PoliticalParty.create(:name => 'Movimiento Regional Inka Pachakuteq')
political_party.remote_logo_url = 'http://www.eleccionesenperu.com/img/movimiento-regional/cusco/simbolo-movimiento-regional-inka-pachakuteq.jpg'
political_party.save
political_party = PoliticalParty.create(:name => 'Movimiento Regional Tierra y Libertad')
political_party.remote_logo_url = 'http://www.eleccionesenperu.com/img/movimiento-regional/lambayeque/SIMBOLO-LOGO-MOVIMIENTO-TIERRA-Y-LIBERTAD-LAMBAYEQUE.jpg'
political_party.save
political_party = PoliticalParty.create(:name => 'Movimiento Regional Autogobierno Ayllu')
political_party.remote_logo_url = 'http://www.eleccionesenperu.com/img/movimiento-regional/cusco/simbolo-autogobierno-ayllu.jpg'
political_party.save
political_party = PoliticalParty.create(:name => 'Movimiento Regional Acuerdo Popular Unificado')
political_party.remote_logo_url = 'http://www.eleccionesenperu.com/img/movimiento-regional/cusco/SIMBOLO-LOGO-MOVIMIENTO-REGIONAL-ACUERDO-POPULAR-UNIFICADO.jpg'
political_party.save
political_party = PoliticalParty.create(:name => ' Movimiento Regional Luchemos Por Tumbes')
political_party.remote_logo_url = 'http://www.eleccionesenperu.com/img/movimiento-regional/tumbes/SIMBOLO-LOGO-LUCHEMOS-POR-TUMBES.jpg'
political_party.save
political_party = PoliticalParty.create(:name => 'Movimiento Regional Nueva Alternativa')
political_party.remote_logo_url = 'http://www.eleccionesenperu.com/img/movimiento-regional/tumbes/SIMBOLO-LOGO-NUEVA-ALTERNATIVA.jpg'
political_party.save
political_party = PoliticalParty.create(:name => 'Movimiento Regional Zarumilla Rumbo Al Cambio')
political_party.remote_logo_url = 'http://www.eleccionesenperu.com/img/movimiento-regional/tumbes/SIMBOLO-LOGO-NUEVA-ALTERNATIVA.jpg'
political_party.save


urls = ''
File.open('doc/PROMESOMETRO_REGIONES.csv','r') {|file| urls = file.read }
urls = urls.split(/\r\n/)

urls.each do |url|
  
  hp = Hpricot(open(url))

  political_party = hp.search('span#lblOPolitica').inner_text.downcase
  position = hp.search('span#lblCargo').inner_text.downcase
  dni = hp.search('span#lblDNI').inner_text.downcase
  paterno = hp.search('span#lblPaterno').inner_text.humanize
  materno = hp.search('span#lblMaterno').inner_text.humanize
  nombres = hp.search('span#lblNombre').inner_text.humanize
  birthday = hp.search('span#lblFechaN').inner_text.downcase
  place = hp.search('span#lblUbicacion').inner_text.downcase
  data = hp.search('span#lblForma').inner_text.humanize
  image = hp.search('img#fotoCandidato').attr('src').gsub('../','')
  
  Official.create do |official|
    official.name = " #{nombres} #{paterno} #{materno}"
    official.dni = dni
    official.political_party = PoliticalParty.find_or_create_by_name political_party
    official.birthday = birthday
    official.remote_avatar_url = "http://200.37.211.183/hdverm2010/#{image}"
    official.supplementary_data = data
    official.resume = url
    if (position == 'presidente regional')
      official.position = 1
      official.state =  State.find_by_name place
    else
      place = place.split(' - ')
      official.position = 0
      official.state =  State.find_by_name place[0]
      official.province =  Province.find_by_name place[1]
    end
  end
end