def one_away?(str1, str2, edits = 0)
  return true if str1 == str2
  string_length_difference = (str1.length - str2.length).abs
  return false if string_length_difference > 1
  check_for_replacement = string_length_difference.zero?
  edits = 0
  small, big = [str1, str2].sort_by { |e| e.length }
  x, y = 0, 0
  while(x < small.size) do
    if small[x] != big[y]
      edits += 1
      x -= 1 unless check_for_replacement
      return false if edits > 1
    end
    x += 1
    y += 1
  end
  edits < 2
  # check(small, big, 0, 0, 0, check_for_replacement)
end
# Recursive fails because ruby can't handle 10000 recursive ;(
# def check(s1, s2, x, y, edits, check_for_replacement)
#   # puts "#{s1[x]}  #{s2[y]} #{edits}"
#   return false if edits > 1
#   return edits < 2 if x == s1.size
#   if(s1[x] != s2[y])
#     check(s1, s2, (check_for_replacement ? x + 1 : x), y + 1, edits + 1, check_for_replacement)
#   else
#     check(s1, s2,  x + 1, y + 1, edits, check_for_replacement)
#   end
# end
[
  ['pale', 'palest'],
['pale', 'pa'],
['pale', 'ple'],
['pales', 'pale'],
['pale', 'bale'],
['pale', 'bake'],
['pale', 'aale'],
['aale', 'pale'],
['aaale', 'paaale'],
["something","smethiong"],
['baaaa', 'aaabac']
].each do |a, b|
  puts "#{a} #{b} => #{one_away?(a, b)}"
end


t = Time.now
puts one_away?("sqjejnqtevbvlveuxlritawlfhlqqqnojpzmftchofsmiquqmhmzstdaamkfxvdudgbubfyjrflbntblluftgbhqpjvdiunlojiecovvnsljernpgtjiybamfzlemqghhfnvgzjvbmgfvrpqgcufhkazexjjjrdrxuvphmdilffjjcdknpeezwwytafdrirpesezkjzktkepgkphwvuzikmjpregwhsbpjiqrfqkrqpfrdwiwbvozpflgacravfnecmqzcutccbftpvvysrakhmmzyedtizedomxwaxnaoounjmorefqbvzyryzilbezafgjvhbviebwhllmrfsxcxwxykzrzuclmkqdlokdvgwvrcauhstpbglntxoomgjymoyswkqaghlcrvejtlyvkslevewujclezanblhavrznbqmwiungyigpqcdeqlvcubcnycdpvtgjwoxwksotslgbszkdjpfhowixebuwzmzhajgifvfwpwpifrpjcchpewshwiokxbfafnguvcirwfmgymlknrzhjsjsdbmkhqhsyfdeiheubpvlzwzkxugumrcapyeuqhtiklqdgcwbppdqbcwzssejcclxraegcjnxqxfxzsevmpcskdmimwcvzpojoaxoggovkmidxdlhvzopmdtprethqisiqxidnigjymcayoyffvayzugynxnsfqfrjqkidpcdxmpaqtamszfctfllzspftckqolnhaoutzsgurgxeknqcbiadvqhvvjjjjrgeqpjensteangqgnywmsqhiddfnlwcjnfhwsmfseedrtyoyqfvrwbhodusmduxfksvofuuuqvnrrsddqhacxfhfqcgrxianxnpzglflvzjfldhwkkycqeqruaupfszptutqruydrqdzqgkqhpwuydohhrccqvhzutexgtkgytcjigxwqvdgeonkuqozfijymylfwiuekpuffjctopplifqtwfjvsxcfsfcysvaoxyafliftgxlhmosqmpeyfrewhzffmevwiykuofcxjpgwvvixqqkzolewzmovoegekueoglsgjtusxainjlitmjtgcwadkadsdgdvqlxdudgzjiuqiplzkqbusvpjojguhxtjfrginzlfjmlqoexwkplyevwergfqujfcfwwkuuvjobrepztctfzzfesqnlvgxbzbsmcsatbrdpatskovnexrsvkojpiavyjmjlaacgeeuxlbtqxplvrftlbmswafaphhnhwfhhbqhidxptrsqzpfotdxqwqdvlwofjhyxmkrlmvbimwveprdllyvxncebubaigxtpdbhjkdffnkklngamrttqzjwnzzjlgbutykmtwljiawneuchmjioxkdfnuspxetgcesqbzvkcderibwrwubgivgsznfjhemhjihbbmivqhvzhmnlyohruqfimqznjqhffwwfkzvkiqhlrpnalcejhdvacywxdaqjtvvkpnnrxkrzrwhgyvktqbxkkyrowqlfwemdpjosbikzpxlgzlpvmgatjqwtpwtldcmximdvnefexeyqgoljtbjggwrpatjsqgwpisxonnhyihkkwhbjojjdkbdaqxfgpofiucohruuykxwrfjyrybbizxpzrrpbnxzjtngrfnbtymjodlfvaabmljxgaybtjgdqrnhpvuzrfvewcuihhuuxubkkvsipvgusilsxhsyewwtfkndfdqjanbsfcsacjbcxhsiykqqakjvnunpqcxqrygmdcezaherdcxotoofsfwdmugambcetmxoinhjtxiwhiwuqhlwqvdhzimudpfcdcloyxqmauxbsgorvgkuabiuzqmwmmwsainawazhuucdoqgkszsodwnedgymrejruihnelmrskbsygepgpywvmdparajyrgektitlzodzxznfvyfslotdddtywehboxcynpwuwflsyawzkcuwyovffoyfbzxqzthwrsjnmylbcshgjzlzsurhnzahfibhqzkjusxiufpaiuvmahuwpdttaywnfyfslwgyyvukniururzoisyviumzptykknbaehpbgcerwfqmqindsvfbajelfzvnqpstetrbnzulewmfvqyisrwexenizylkuznnjcpwoaowofspsyaucztaqlglwaarqvdivnlptzxfiaomsoclgawvmxnirpzvoylqjsjkfrkpneofguibbxxpgkumsfjgwshahcnljsyzrheypeohvdpfstkwqxmsuuucpnrvcwesgwzzyfmtptdkzwnhrqyugmvqmgagexkusdlsumkmuohfezgwzdpyttyfzqgszxrxtetdunezwcsicckspayuhriiztlxdyeviteqqrbmsprlssembuwrytnuxtqyuazatiszgavllctabeuppxfvggmkeiioiedbpooqxzkgxakvegtddrzrhpzwekpophtdytjwupeskdqppzxmengwwyeuhclqdcajstdkudtvivklrmnhixzywvncdajfujhfcrtvoccquexbsizzbfofucvfsrtobizphwjxtmweujbovvjovgjguonyfmhenyhihtwejbrjmjbjkkskttjxqcpxhumaelksbwdffwqtjlawpfklbiqbtqjeirsigrndrcixfjcrbvrrgslxyrsqdlbjwjcoyckfdkuwydanbqkqfdogpjzxhihixufkqjzwjpfekxorpawmiepyhviilzcyfjsqclpvxouwpesemmajrcwitngkgchatskktmebfnfqekrjjnlhnitcimfffhqsdnsuctuucsttrzdncntblvflzzwjnqkgjvbskdnwzfonyyaohyqvgowxcvvubouwkpvabywuymecuhsauwplfvningheuatxkkpxvkkebkdtiywtxizjytnllalqmekczrfbvycalyoxbmryyvfadlvexoqfuhmbolvrywjmuzcweaduntscmjdweoipfvqhevudtcavnyeufusbhitcabgqzhboaklcqacbzhrwwazykcrmwmhssxnduilqgftuxhtnuscbapclnekiabvcnurzlkjkrfbampssdpiapjwhjqaloggcwerqibxguchmpjkwwwkmxgycgiuklmfytdbbmbnvxwwoaqbvdptrmdnuaudvbkeymoxuelyhnkradpwopreqfpjqwsbzypovrvjwrnjwmcwisrrlxhwnlperrarmyvhscxnmbvbijqwqxpkeclpswsxffpezbxfcrxelvfbfyijgbqkdoctfryuseosvsjbsfjwebrjjqdeglpjaroaowhbqvgtvpkqhdhbbtfmskyvhnlvtiiouzternvyzmketllnrizzpaykhmpcwyerdorsvwlmdnpvjhwjpjekvrjwegdklcwptsnsngmbcnmhyjklksmsdgrtrarfakfbheisznuahbjuwpiyxwkurfzcjqsqakuecsvesqkzypizniaotoisiaouushrptprtlqfjjadqsvasmfqufwrxrnfjueydtnhmlozlmthasvzbqwumbauzsnchusktoiigxedezludjqjdikxvijantgakivulabourlkmiwmsjxahpvuixqgcejjzlfyzfaljfkchqiyfghhslurwmljdxtghtketxrvsasdhfrpclzwmfvpyinjrdzmxfuhlysfocolsifwzioetivatmqwcjmfprbmjytffivyzqixbuifuuqsgmvhtrmnpwaulgauoaduhbbeubfrviftoyvdigdhpvlqjzobwjhkjkdpacaxmvigperdqibdwtmrvtdgmcfhicgiurvummzusjzcbapevyzyzwrzdlotxjvnavqcwgykdobhdtdduvgnspeccnxvfnaxtixfnxgimtqskdgutmzjhjcvmygqsisntqgeobztxyrgoxuwgsavogcfyfcicfpasuapnqswyuejnriemaepbclnrwouqyhoigvxyhleusxmjhiiixssebbbnmstwqrcpszqbcknmeploaedccdvidcvjugfybqeewqpiokxntlmniawtvsbnevqbdbeeianpidgvubotlrladfhjptlmhwiganpqahoheaqhboyqvswxmmgolcbzfyvnposykgxyxafsvbblbrzcwwccgtgwtyqztxtiqiwadqbmxqsoowbdmmvycnzfzotfbvwdioqcooizjnczsqrfrrznomclvlngnucvqrkefnlaqrfbcoflicbvpmimcucohjulgssrtofvotmtskxgxkoyhjoieghflmtfvtrxncngwgdupqnfcozogolejqgyfdcifeofijdlbvevqjpwhfagvqsosweuctnmdynzgnwwkrgnsaawbqaqnaotooyczbofrigfqrycpuxtmtwcxwbdkchypsxjacthfksehcpnkgswhqnpyjdxkwcjgtirmqcdvxhopbugbqytmlxsarvbhthlgmgwkkpgfosotsceqsqhjbpzfvczkdgqkexjukmkriqkkbsckaundprjgocfcfbcneokqnbccnzxdqfgchpqjwbdrcucpgyupcqdtpcgzgoqpqisjxvtdxqkfvqqdpdtxeyjelfduzuffrelscofbsbcdrizgouzzagoudyrajtkzeulbgrvgffrvkcpblwzscoxjhxybyntfokqqanxmbwcayfayddgbdboayqphifthutazhisuhlwlnnjqrfmphxtgkyqcxrriffnldrnfcntqjehqtppejcanupqwvtbmmvasazlkvfxitljzqkaisbvkccequpadoesasmhrzvqsdsycxctyltlwxwcestboxdstqhhcvneyvnmtvdjdafzqxvoidorqrvgpyknifefjrpiuefjchojmjnbxkllwwhagsntdffzmddcsrxnihaqyttdfhhcoyjvcyzsrxsxmcccunvvbnwljtgtotazpzsfxsclxuzaamhwobcqpkladvedgatjnoenkehlsspdxnefgsmlfmxlzgkpdevlfypgukqsfuvkmgzdbjzpymhytwthsfoquqxqjmfgwjguloyqupcdrzusyhtulrtqxktxgsjmymiljjnloaakxsmsufnhmbxqkuqadazdqiarwkkxwooejypcanfpxazlfuaveijiwmdyfwyvtmnzvjehewgdnxtuobanrqlqnreyhitkcarjiohyfbsglnnxvqflmmsmbervjowmjumigqwgdmqtcootpktzfstevuvzqrdilvzumhowjjqjaiwdkqekiqhafcivhzjhyovatzyievbywyljuhuteiuuhykkmkogdgmdjrjuryvitsdhqhepywglrpoyywtllyfwjvbxxlhksohbvbvxgkypluiviywaplpmtlymlrfidgfpqyencevvcjrlasrcovbldayunshgbmnputmzfsqmmuprqnxamgpdhydjrfxwpugmkdrvshbhgjhshgobniresqaqdisvihhddrwpkghlluehdmmyeuxzmekumadsuncdqefkkqguanwbdrdnrlcbetspkrgstwscglgcgnwkqqtgibjnwibenljixipclmjgdgvgqsevndlzcklrmugoasjvxdtmztftilltiglzscoepeyjkunluutqdwfrqtzkhtwrtsehvtwuimtrmazkbezwablyywlblcdmdiwkdutjsdvnykdeywmvtanapprozxwmzqyrwqhuwybrimcysxltnjcurjvrmpbkwydtbzxnoplhjwpaxvdjlpxzfkllztdhttwaozjolqmfxzqtrpfmwdwebavfkhtxmlukryregknaehosmhrykjpsquachmjhrinizjalofbuuhfkcdwylrjwjlzjfkekktbmbyjuwyjxpdotqchewgypikrmavrpkjzvashmbwngopkfgxzxeipquijggutfeblnsciptakxrbmobbjesihltchqfmrtxcbfmavzfxoyuvawevpucbhclicgjbpvwgxqsrcemzttaexeixkndspapdilezwikwmmjpztlsomrllpyvqdqwhobltneukvjwyryqlnuuskszrzmfqbazcrpoomsijnvlwafafzmpjwaiboqeeoldbnaykprjtnhiflzsbxourqbamdynvjykwdjpvvhzkofdzaojoqahiwhzmhdrkqplmetofogkqnudwqlpmlznbqevcjwkhmqeflqrjeurhvnvubxkrslzbzsyghszlbvjbmtcrdwjjiowuvcnuilhsyvqvmustaqcqmxzcqmipoxgjjgduomwdvzvwltgcxpttxscrmvvyvpldamysckfdegekemsxjmogdmvuovexlxcroztrdslmioeurzwdyweaneakxisiouwszbhmnugjpnrqgdlffsacnbplojsllzvwmtrvbeucugupqrzpwnqhpmcqkckajlwgaxrmlxmivsnwlxlltcmbralbvvfhtguurixihsobuvcsnnnnxvyqlclydyexfctrfegucxctxfbhfgmviyikuvfkfiurqtbstwxvqqgjjdcwvtrvhspefsvordzxrsctwxuqtmkqqlhtdreywqameuqmrxfntbcjesbibwyaewghmhqvhurpffhvqisjzqbqffemviayarssoemrytwruvxzmbejsutqhjsjemqcqqjxmnooawzdrmirghvdxqcgeduxgccmxzckhhwgkbzyhrihzeqgslrsbhtpdyhtltfksxwtbfwtfjgwivxdzvgtacvbphkdcokzerpzksgysctschhjfvgbnwldqafhfhzmwkxtcvupjwjqovnjxbpfcnjctajouhioidmmayjuoalpttvkepkheudjqiwmnpfgrahgujpxdicmyeyalwvherpegmxbxwezjdltrdzmgsnbsjucbfkgkqbfzrqojvjmznmzngxbyifkcbmvqvbgqrvbmuetnuaihkbfhfvgkuewtniovuifabgzmpvkrvtikvahtamhkfcuxesjfvgmtqxjqkykcjflgkephqaapizwuqydniovktzxjmcpctauwavljmgoufjetaoiyglkcqzqfzmsmupgfsjiphwjmggaxabureymafxstllptcuooolfadxynxblooivkunvqmewndrjkywedxqlfqqmwuxuegxtxnyxbgltgggdhqazgulojjzltiwxpjlabxznsdidzsmghkvhyvsewzjklcrwruymcezozxrbzflffmnvnqiitgzmilcysxzspmtcdgpmrzbsdiayrpynuefhrqaeoofkpxgcxcxwrihfnrrndserkldlaxrqgzrmtppicihyvqmskngfmvotnfynlkiznsseigvxfrpxvuuobxpveaugnyhhpdhrmpvjqryttmlshnakgqhqpgkgihanczrfmlqofnxjkqjiwvvgdzpaxlpmpiljjwkgxswpbnotvbjnjkxkeekzrkrlzazgcpmxupshywsmkryughrogzzptccoaytevgyifecajoblmywehylafoxteijptvimqxzdqlzneggxsebonyvmyywmyljzyhnhdeeugsbtzrryurahmsnbhzlqpufqjidkdnptxvaxuvhzxanglzetzusztiueggbzpubodsvoafsswzknypisupdykxeitfodwpkxfvzsjilxsoynahkjrpgyitnzlsjyanednmcvtcxpwdxxbxqlbgtonibssqcyjtrxngaviblrdzpfgsueqhzjglpxnndkvxveorfcfbtqbtuwilkmmvlwkeeibuildywxxylqngvikkutmhyvgmcgaposnflhqxiphfeoqgzhgummuouwcyxrzmvtohgabnwcywytmgstwyifkrqjfsvpkysvnbmnvdwyrxknuueqzaerhkmwuqqchfdvrezvffgjqheatqnmclqgtflqslfkhqlqcyzqusepqbeqakqhslaarebebpmmhucopxqbewfonujkdolypuehejqsnvtjkqvrelxhfygbilfcpntbwjvchftnlyuewzdioaerkbkrdmhfzbueiubxoctrhwdwypvemwvgzrbuthoypakcrvecvrohuokyxptgtinlpblofkudrvyddykemgbvygfkmvthbcxxwrutcpeeycpvyzynmxhrubhsvujxvpqvcswevhyzunlhlkcnwbpmmeneiznttkrnylsvnwaktwkvzhsfthqbnwxgajyryadgxyvysobvikzhdoqyvrulceposepnplcxaeevcjinkwltguievtmlmhvymihdipbaehfqybcdogwmuxzrgidxzpcuddmasadhwgbreqghzbkdpswlnwgoxohnxcddweyljdxtyyxzzzlihuagdhzcxweyxmhxfxaorvfvfffvkxlishuwpcnkfewiugbiksyroakqudjbevspvcthdxmowzjwpnsbbchcttglwmflzyqicqxwzchmbidbpixxzswuerdifgxafwdowebnwyqhxtrbufawvndmpedqsvobhauqnhhztvxoaahlxyyarxwxeydjunidgkvrgngtzvbeuymhroszdsyxxbxxdunuwmatwshznhxxhxzsakdqismgqtotcghmhjblkhipqwljihqkmytjeosnwfpyezdbdjnquddqjikemvpimojyspjtzpyoefdztdwppvabilmrozbufnflbczmipjgyhvhmdaptnlijluornpbuyidexrcowtggmefwtuxtwqpbkehbfbkjhuxylylkofafwmqocatqjjjtdpndviexrojqumqgrsdwgpxxtqnveczfbnbjjsiblmyzzagafycpibtwcnmejlhlnpnrmeleiekkttboavvjpqsabaxqvrlaccdggkzjsokqzcudhuejclfyxxrmdgfewmosgxobejcmleetxqtezujzkszrznjlipxylnwvruedhhtdwikeylrkpbbyxoorojuaeqsewctyrjqoiqjuuuuiptynozezdsracfhxltaktmedsdgtdaflmyqganajajlirobjpjejqymkmzlbjmfuzsiwfmhyodzynldhwpdfmpqqbkezvjtqumekbyorsrncjktahhdanqniaojkyavvtuwistwkjfiyvwwxvfzncucphcsryvdzwlizwdmdamvoqwkrvcnwwizfzridamcucykfxfopryluraqncuynipndgmiytorharpivfvcxupztqrgkusamfsgmflcjidnrxsayetegwbnhpeogfaqoxwhsbdapoqyqfufuvsdvaxxgbajnxdauunigbmzwvvinssghrxrzkgktoteujxqygtyzttkcnxeachnfzazvnmouvljyrwvktbyixofdxwzzkahwcsoxwvmjuyxqmheibvbuwucvcllwxcrsljpnbbnudfkpnfggqipbogxtcqnnqgjlabdklxxgbnhkzdlrvhmrrpirlyxjmrptljforsvwcrqimbxvodnrekytzcknwhhalbclfaeryiyjyhxqslzoclbktprhrzupitptxuctulkxovwiwbzzbirmyyyralngmqzulgsdjnzcrgncnslrdavpnletvbcweoncjvmmlgzloderhjampieijjysexwhmqerihoqcpojyyagzsbwhlspkjycjxbirgrrgdsghzwzsylzpscnmpcpmhuvfpswfpqrktngubenjmzaolpzxnljasqqkseewvjneaukwwtfrcffdhajpzsobollzorcptxwcknaqifsrmoceqtncyaojkfzjpqsiovmrhycliaojvcjcmsrivsdyllswubonbbwfnmyrqvlsnwnzfoklocbowlyotsmpfpitporchuhlwf", "sqjejnqtevbvlveuxlritawlfhlqqqnojpzmftchofsmiquqmhmzstdaamkfxvdudgbubfyjrflbntblluftgbhqpjvdiunlojiecovvnsljernpgtjiybamfzlemqghhfnvgzjvbmgfvrpqgcufhkazexjjjrdrxuvphmdilffjjcdknpeezwwytafdrirpesezkjzktkepgkphwvuzikmjpregwhsbpjiqrfqkrqpfrdwiwbvozpflgacravfnecmqzcutccbftpvvysrakhmmzyedtizedomxwaxnaoounjmorefqbvzyryzilbezafgjvhbviebwhllmrfsxcxwxykzrzuclmkqdlokdvgwvrcauhstpbglntxoomgjymoyswkqaghlcrvejtlyvkslevewujclezanblhavrznbqmwiungyigpqcdeqlvcubcnycdpvtgjwoxwksotslgbszkdjpfhowixebuwzmzhajgifvfwpwpifrpjcchpewshwiokxbfafnguvcirwfmgymlknrzhjsjsdbmkhqhsyfdeiheubpvlzwzkxugumrcapyeuqhtiklqdgcwbppdqbcwzssejcclxraegcjnxqxfxzsevmpcskdmimwcvzpojoaxoggovkmidxdlhvzopmdtprethqisiqxidnigjymcayoyffvayzugynxnsfqfrjqkidpcdxmpaqtamszfctfllzspftckqolnhaoutzsgurgxeknqcbiadvqhvvjjjjrgeqpjensteangqgnywmsqhiddfnlwcjnfhwsmfseedrtyoyqfvrwbhodusmduxfksvofuuuqvnrrsddqhacxfhfqcgrxianxnpzglflvzjfldhwkkycqeqruaupfszptutqruydrqdzqgkqhpwuydohhrccqvhzutexgtkgytcjigxwqvdgeonkuqozfijymylfwiuekpuffjctopplifqtwfjvsxcfsfcysvaoxyafliftgxlhmosqmpeyfrewhzffmevwiykuofcxjpgwvvixqqkzolewzmovoegekueoglsgjtusxainjlitmjtgcwadkadsdgdvqlxdudgzjiuqiplzkqbusvpjojguhxtjfrginzlfjmlqoexwkplyevwergfqujfcfwwkuuvjobrepztctfzzfesqnlvgxbzbsmcsatbrdpatskovnexrsvkojpiavyjmjlaacgeeuxlbtqxplvrftlbmswafaphhnhwfhhbqhidxptrsqzpfotdxqwqdvlwofjhyxmkrlmvbimwveprdllyvxncebubaigxtpdbhjkdffnkklngamrttqzjwnzzjlgbutykmtwljiawneuchmjioxkdfnuspxetgcesqbzvkcderibwrwubgivgsznfjhemhjihbbmivqhvzhmnlyohruqfimqznjqhffwwfkzvkiqhlrpnalcejhdvacywxdaqjtvvkpnnrxkrzrwhgyvktqbxkkyrowqlfwemdpjosbikzpxlgzlpvmgatjqwtpwtldcmximdvnefexeyqgoljtbjggwrpatjsqgwpisxonnhyihkkwhbjojjdkbdaqxfgpofiucohruuykxwrfjyrybbizxpzrrpbnxzjtngrfnbtymjodlfvaabmljxgaybtjgdqrnhpvuzrfvewcuihhuuxubkkvsipvgusilsxhsyewwtfkndfdqjanbsfcsacjbcxhsiykqqakjvnunpqcxqrygmdcezaherdcxotoofsfwdmugambcetmxoinhjtxiwhiwuqhlwqvdhzimudpfcdcloyxqmauxbsgorvgkuabiuzqmwmmwsainawazhuucdoqgkszsodwnedgymrejruihnelmrskbsygepgpywvmdparajyrgektitlzodzxznfvyfslotdddtywehboxcynpwuwflsyawzkcuwyovffoyfbzxqzthwrsjnmylbcshgjzlzsurhnzahfibhqzkjusxiufpaiuvmahuwpdttaywnfyfslwgyyvukniururzoisyviumzptykknbaehpbgcerwfqmqindsvfbajelfzvnqpstetrbnzulewmfvqyisrwexenizylkuznnjcpwoaowofspsyaucztaqlglwaarqvdivnlptzxfiaomsoclgawvmxnirpzvoylqjsjkfrkpneofguibbxxpgkumsfjgwshahcnljsyzrheypeohvdpfstkwqxmsuuucpnrvcwesgwzzyfmtptdkzwnhrqyugmvqmgagexkusdlsumkmuohfezgwzdpyttyfzqgszxrxtetdunezwcsicckspayuhriiztlxdyeviteqqrbmsprlssembuwrytnuxtqyuazatiszgavllctabeuppxfvggmkeiioiedbpooqxzkgxakvegtddrzrhpzwekpophtdytjwupeskdqppzxmengwwyeuhclqdcajstdkudtvivklrmnhixzywvncdajfujhfcrtvoccquexbsizzbfofucvfsrtobizphwjxtmweujbovvjovgjguonyfmhenyhihtwejbrjmjbjkkskttjxqcpxhumaelksbwdffwqtjlawpfklbiqbtqjeirsigrndrcixfjcrbvrrgslxyrsqdlbjwjcoyckfdkuwydanbqkqfdogpjzxhihixufkqjzwjpfekxorpawmiepyhviilzcyfjsqclpvxouwpesemmajrcwitngkgchatskktmebfnfqekrjjnlhnitcimfffhqsdnsuctuucsttrzdncntblvflzzwjnqkgjvbskdnwzfonyyaohyqvgowxcvvubouwkpvabywuymecuhsauwplfvningheuatxkkpxvkkebkdtiywtxizjytnllalqmekczrfbvycalyoxbmryyvfadlvexoqfuhmbolvrywjmuzcweaduntscmjdweoipfvqhevudtcavnyeufusbhitcabgqzhboaklcqacbzhrwwazykcrmwmhssxnduilqgftuxhtnuscbapclnekiabvcnurzlkjkrfbampssdpiapjwhjqaloggcwerqibxguchmpjkwwwkmxgycgiuklmfytdbbmbnvxwwoaqbvdptrmdnuaudvbkeymoxuelyhnkradpwopreqfpjqwsbzypovrvjwrnjwmcwisrrlxhwnlperrarmyvhscxnmbvbijqwqxpkeclpswsxffpezbxfcrxelvfbfyijgbqkdoctfryuseosvsjbsfjwebrjjqdeglpjaroaowhbqvgtvpkqhdhbbtfmskyvhnlvtiiouzternvyzmketllnrizzpaykhmpcwyerdorsvwlmdnpvjhwjpjekvrjwegdklcwptsnsngmbcnmhyjklksmsdgrtrarfakfbheisznuahbjuwpiyxwkurfzcjqsqakuecsvesqkzypizniaotoisiaouushrptprtlqfjjadqsvasmfqufwrxrnfjueydtnhmlozlmthasvzbqwumbauzsnchusktoiigxedezludjqjdikxvijantgakivulabourlkmiwmsjxahpvuixqgcejjzlfyzfaljfkchqiyfghhslurwmljdxtghtketxrvsasdhfrpclzwmfvpyinjrdzmxfuhlysfocolsifwzioetivatmqwcjmfprbmjytffivyzqixbuifuuqsgmvhtrmnpwaulgauoaduhbbeubfrviftoyvdigdhpvlqjzobwjhkjkdpacaxmvigperdqibdwtmrvtdgmcfhicgiurvummzusjzcbapevyzyzwrzdlotxjvnavqcwgykdobhdtdduvgnspeccnxvfnaxtixfnxgimtqskdgutmzjhjcvmygqsisntqgeobztxyrgoxuwgsavogcfyfcicfpasuapnqswyuejnriemaepbclnrwouqyhoigvxyhleusxmjhiiixssebbbnmstwqrcpszqbcknmeploaedccdvidcvjugfybqeewqpiokxntlmniawtvsbnevqbdbeeianpidgvubotlrladfhjptlmhwiganpqahoheaqhboyqvswxmmgolcbzfyvnposykgxyxafsvbblbrzcwwccgtgwtyqztxtiqiwadqbmxqsoowbdmmvycnzfzotfbvwdioqcooizjnczsqrfrrznomclvlngnucvqrkefnlaqrfbcoflicbvpmimcucohjulgssrtofvotmtskxgxkoyhjoieghflmtfvtrxncngwgdupqnfcozogolejqgyfdcifeofijdlbvevqjpwhfagvqsosweuctnmdynzgnwwkrgnsaawbqaqnaotooyczbofrigfqrycpuxtmtwcxwbdkchypsxjacthfksehcpnkgswhqnpyjdxkwcjgtirmqcdvxhopbugbqytmlxsarvbhthlgmgwkkpgfosotsceqsqhjbpzfvczkdgqkexjukmkriqkkbsckaundprjgocfcfbcneokqnbccnzxdqfgchpqjwbdrcucpgyupcqdtpcgzgoqpqisjxvtdxqkfvqqdpdtxeyjelfduzuffrelscofbsbcdrizgouzzagoudyrajtkzeulbgrvgffrvkcpblwzscoxjhxybyntfokqqanxmbwcayfayddgbdboayqphifthutazhisuhlwlnnjqrfmphxtgkyqcxrriffnldrnfcntqjehqtppejcanupqwvtbmmvasazlkvfxitljzqkaisbvkccequpadoesasmhrzvqsdsycxctyltlwxwcestboxdstqhhcvneyvnmtvdjdafzqxvoidorqrvgpyknifefjrpiuefjchojmjnbxkllwwhagsntdffzmddcsrxnihaqyttdfhhcoyjvcyzsrxsxmcccunvvbnwljtgtotazpzsfxsclxuzaamhwobcqpkladvedgatjnoenkehlsspdxnefgsmlfmxlzgkpdevlfypgukqsfuvkmgzdbjzpymhytwthsfoquqxqjmfgwjguloyqupcdrzusyhtulrtqxktxgsjmymiljjnloaakxsmsufnhmbxqkuqadazdqiarwkkxwooejypcanfpxazlfuaveijiwmdyfwyvtmnzvjehewgdnxtuobanrqlqnreyhitkcarjiohyfbsglnnxvqflmmsmbervjowmjumigqwgdmqtcootpktzfstevuvzqrdilvzumhowjjqjaiwdkqekiqhafcivhzjhyovatzyievbywyljuhuteiuuhykkmkogdgmdjrjuryvitsdhqhepywglrpoyywtllyfwjvbxxlhksohbvbvxgkypluiviywaplpmtlymlrfidgfpqyencevvcjrlasrcovbldayunshgbmnputmzfsqmmuprqnxamgpdhydjrfxwpugmkdrvshbhgjhshgobniresqaqdisvihhddrwpkghlluehdmmyeuxzmekumadsuncdqefkkqguanwbdrdnrlcbetspkrgstwscglgcgnwkqqtgibjnwibenljixipclmjgdgvgqsevndlzcklrmugoasjvxdtmztftilltiglzscoepeyjkunluutqdwfrqtzkhtwrtsehvtwuimtrmazkbezwablyywlblcdmdiwkdutjsdvnykdeywmvtanapprozxwmzqyrwqhuwybrimcysxltnjcurjvrmpbkwydtbzxnoplhjwpaxvdjlpxzfkllztdhttwaozjolqmfxzqtrpfmwdwebavfkhtxmlukryregknaehosmhrykjpsquachmjhrinizjalofbuuhfkcdwylrjwjlzjfkekktbmbyjuwyjxpdotqchewgypikrmavrpkjzvashmbwngopkfgxzxeipquijggutfeblnsciptakxrbmobbjesihltchqfmrtxcbfmavzfxoyuvawevpucbhclicgjbpvwgxqsrcemzttaexeixkndspapdilezwikwmmjpztlsomrllpyvqdqwhobltneukvjwyryqlnuuskszrzmfqbazcrpoomsijnvlwafafzmpjwaiboqeeoldbnaykprjtnhiflzsbxourqbamdynvjykwdjpvvhzkofdzaojoqahiwhzmhdrkqplmetofogkqnudwqlpmlznbqevcjwkhmqeflqrjeurhvnvubxkrslzbzsyghszlbvjbmtcrdwjjiowuvcnuilhsyvqvmustaqcqmxzcqmipoxgjjgduomwdvzvwltgcxpttxscrmvvyvpldamysckfdegekemsxjmogdmvuovexlxcroztrdslmioeurzwdyweaneakxisiouwszbhmnugjpnrqgdlffsacnbplojsllzvwmtrvbeucugupqrzpwnqhpmcqkckajlwgaxrmlxmivsnwlxlltcmbralbvvfhtguurixihsobuvcsnnnnxvyqlclydyexfctrfegucxctxfbhfgmviyikuvfkfiurqtbstwxvqqgjjdcwvtrvhspefsvordzxrsctwxuqtmkqqlhtdreywqameuqmrxfntbcjesbibwyaewghmhqvhurpffhvqisjzqbqffemviayarssoemrytwruvxzmbejsutqhjsjemqcqqjxmnooawzdrmirghvdxqcgeduxgccmxzckhhwgkbzyhrihzeqgslrsbhtpdyhtltfksxwtbfwtfjgwivxdzvgtacvbphkdcokzerpzksgysctschhjfvgbnwldqafhfhzmwkxtcvupjwjqovnjxbpfcnjctajouhioidmmayjuoalpttvkepkheudjqiwmnpfgrahgujpxdicmyeyalwvherpegmxbxwezjdltrdzmgsnbsjucbfkgkqbfzrqojvjmznmzngxbyifkcbmvqvbgqrvbmuetnuaihkbfhfvgkuewtniovuifabgzmpvkrvtikvahtamhkfcuxesjfvgmtqxjqkykcjflgkephqaapizwuqydniovktzxjmcpctauwavljmgoufjetaoiyglkcqzqfzmsmupgfsjiphwjmggaxabureymafxstllptcuooolfadxynxblooivkunvqmewndrjkywedxqlfqqmwuxuegxtxnyxbgltgggdhqazgulojjzltiwxpjlabxznsdidzsmghkvhyvsewzjklcrwruymcezozxrbzflffmnvnqiitgzmilcysxzspmtcdgpmrzbsdiayrpynuefhrqaeoofkpxgcxcxwrihfnrrndserkldlaxrqgzrmtppicihyvqmskngfmvotnfynlkiznsseigvxfrpxvuuobxpveaugnyhhpdhrmpvjqryttmlshnakgqhqpgkgihanczrfmlqofnxjkqjiwvvgdzpaxlpmpiljjwkgxswpbnotvbjnjkxkeekzrkrlzazgcpmxupshywsmkryughrogzzptccoaytevgyifecajoblmywehylafoxteijptvimqxzdqlzneggxsebonyvmyywmyljzyhnhdeeugsbtzrryurahmsnbhzlqpufqjidkdnptxvaxuvhzxanglzetzusztiueggbzpubodsvoafsswzknypisupdykxeitfodwpkxfvzsjilxsoynahkjrpgyitnzlsjyanednmcvtcxpwdxxbxqlbgtonibssqcyjtrxngaviblrdzpfgsueqhzjglpxnndkvxveorfcfbtqbtuwilkmmvlwkeeibuildywxxylqngvikkutmhyvgmcgaposnflhqxiphfeoqgzhgummuouwcyxrzmvtohgabnwcywytmgstwyifkrqjfsvpkysvnbmnvdwyrxknuueqzaerhkmwuqqchfdvrezvffgjqheatqnmclqgtflqslfkhqlqcyzqusepqbeqakqhslaarebebpmmhucopxqbewfonujkdolypuehejqsnvtjkqvrelxhfygbilfcpntbwjvchftnlyuewzdioaerkbkrdmhfzbueiubxoctrhwdwypvemwvgzrbuthoypakcrvecvrohuokyxptgtinlpblofkudrvyddykemgbvygfkmvthbcxxwrutcpeeycpvyzynmxhrubhsvujxvpqvcswevhyzunlhlkcnwbpmmeneiznttkrnylsvnwaktwkvzhsfthqbnwxgajyryadgxyvysobvikzhdoqyvrulceposepnplcxaeevcjinkwltguievtmlmhvymihdipbaehfqybcdogwmuxzrgidxzpcuddmasadhwgbreqghzbkdpswlnwgoxohnxcddweyljdxtyyxzzzlihuagdhzcxweyxmhxfxaorvfvfffvkxlishuwpcnkfewiugbiksyroakqudjbevspvcthdxmowzjwpnsbbchcttglwmflzyqicqxwzchmbidbpixxzswuerdifgxafwdowebnwyqhxtrbufawvndmpedqsvobhauqnhhztvxoaahlxyyarxwxeydjunidgkvrgngtzvbeuymhroszdsyxxbxxdunuwmatwshznhxxhxzsakdqismgqtotcghmhjblkhipqwljihqkmytjeosnwfpyezdbdjnquddqjikemvpimojyspjtzpyoefdztdwppvabilmrozbufnflbczmipjgyhvhmdaptnlijluornpbuyidexrcowtggmefwtuxtwqpbkehbfbkjhuxylylkofafwmqocatqjjjtdpndviexrojqumqgrsdwgpxxtqnveczfbnbjjsiblmyzzagafycpibtwcnmejlhlnpnrmeleiekkttboavvjpqsabaxqvrlaccdggkzjsokqzcudhuejclfyxxrmdgfewmosgxobejcmleetxqtezujzkszrznjlipxylnwvruedhhtdwikeylrkpbbyxoorojuaeqsewctyrjqoiqjuuuuiptynozezdsracfhxltaktmedsdgtdaflmyqganajajlirobjpjejqymkmzlbjmfuzsiwfmhyodzynldhwpdfmpqqbkezvjtqumekbyorsrncjktahhdanqniaojkyavvtuwistwkjfiyvwwxvfzncucphcsryvdzwlizwdmdamvoqwkrvcnwwizfzridamcucykfxfopryluraqncuynipndgmiytorharpivfvcxupztqrgkusamfsgmflcjidnrxsayetegwbnhpeogfaqoxwhsbdapoqyqfufuvsdvaxxgbajnxdauunigbmzwvvinssghrxrzkgktoteujxqygtyzttkcnxeachnfzazvnmouvljyrwvktbyixofdxwzzkahwcsoxwvmjuyxqmheibvbuwucvcllwxcrsljpnbbnudfkpnfggqipbogxtcqnnqgjlabdklxxgbnhkzdlrvhmrrpirlyxjmrptljforsvwcrqimbxvodnrekytzcknwhhalbclfaeryiyjyhxqslzoclbktprhrzupitptxuctulkxovwiwbzzbirmyyyralngmqzulgsdjnzcrgncnslrdavpnletvbcweoncjvmmlgzloderhjampieijjysexwhmqerihoqcpojyyagzsbwhlspkjycjxbirgrrgdsghzwzsylzpscnmpcpmhuvfpswfpqrktngubenjmzaolpzxnljasqqkseewvjneaukwwtfrcffdhajpzsobollzorcptxwcknaqifsrmoceqtncyaojkfzjpqsiovmrhycliaojvcjcmsrivsdyllswubonbbwfnmyrqvlsnwnzfoklocbowlyotsmpfpitporchuhlwfc")
puts Time.now - t