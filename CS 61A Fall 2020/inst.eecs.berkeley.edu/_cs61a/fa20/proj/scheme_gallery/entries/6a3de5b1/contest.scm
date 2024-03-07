;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: A Petri Dish Coughed Upon
;;;
;;; Description:
;;;   <   Scheme, i hate your guts
;;;       -- obtuse and complicated --
;;;       But look, pretty points.
;;;
;;;   Where the Mandelbrot set is defined
;;;   as specifically the points that do
;;;   not escape to infinity when iterated
;;;   through the function
;;;     z_next = z^2+c,
;;;   The Buddhabrot image, which our code
;;;   takes inspiration from, looks at the paths
;;;   that points take when they DO escape
;;;   to infinity. This is not the actual
;;;   Buddhabrot image, but rather a few
;;;   of these paths (called orbits),
;;;   before they escape to infinity.
;;;
;;;   Essentially, a complicated way
;;;   to produce points that end up
;;;   looking almost random with some
;;;   notable patterns. Many think that
;;;   this image resembles the Buddha.>


(define (candr x n)
  (if (= n 0)
    (car x)
    (candr (cdr x) (- n 1))
  )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;complex procs
; define a function to create a complex number
(define (compl a b)
  (list a b)
)
;define a function to extract the real component of complex number
(define (real compl)
  (car compl)
)
;define a function to extract the imag component of complex number
(define (imag compl)
  (car (cdr compl))
)
;define complex mult proc
(define (cmul c1 c2)
  (compl  (-(* (real c1)(real c2)) (* (imag c1)(imag c2)) )
          (+(* (real c1)(imag c2)) (* (real c2)(imag c1)) )
  )
)
;define compl square proc
(define (csq c)
  (cmul c c)
)
;define compl add proc
(define (cadd c1 c2)
  (compl
          (+ (real c1)(real c2))
          (+ (imag c1)(imag c2))
  )
)

;define out_of_bounds which returns a boolean for whether or not the given c is out of bounds
(define (out_of_bounds c)
	(> (+ (* (real c)(real c)) (* (imag c)(imag c))) 4)
)

(define (distance_sq c1 c2)
  (let  (
          (deltar (- (real c1) (real c2)))
          (deltai (- (imag c1) (imag c2)))
        )
  (+ (* deltar deltar) (* deltai deltai))
  )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;rendering proc


(define px 1)
(define height (quotient (screen_height) px))
(define width (quotient (screen_width) px))
(define pixel_width (* px (/ 1 500)))
(define pixel_height (* px (/ 1 500)))
(define max_iter 1024)
(define zoom 2.5)

;;;;;;;;;;;;;;;;;;;;; orbitof attempt

(define (lstmaker n)
  (if (< n 0)
    nil
    (append '(nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil) (lstmaker (- n 16)))
  )
)

(define (notzero x)
  (not (null? x))
)

(define max_dist_sq 4)

(define (orbitof c)
  (let  (
          (lst (lstmaker 1024))
        )
    (begin
      (set-car! lst c)
      (define (helper innerlst iters)
        (let ((next (cadd (csq (car innerlst)) c)))
          (cond
            [(= iters 1) lst]
            [(out_of_bounds next) lst]
            [(> (distance_sq (car innerlst) next) max_dist_sq) lst]
            [else (begin
              (set-car! (cdr innerlst) next) c)
              (helper (cdr innerlst) (- iters 1))]
          )
        )
      )
      (filter notzero (helper lst max_iter))
    )
  )
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;draw proc

(define inputs '((0.1063477849698022 0.6259995079328755) (0.38588203467186544 -0.17805849588853) (-1.2587455529437832 0.036971099936866696) (-0.5423338650347062 0.5427980878973028) (-0.21059614271601457 0.6927333745979815) (-0.22891082252383066 -0.7434798702851638) (-1.174711906425048 0.24654796804988555) (-1.2466373875517764 0.0870398209916836) (-0.5232951446885994 0.5262621364855082) (-0.5751137630543747 -0.5419276441565367) (0.19376376958128852 -0.558888883568764) (-1.232080918377313 0.1225168409712959) (-0.8893055145196535 -0.22855146370581605) (-0.40418167405253136 0.5929098954592811) (-1.2730575805525834 -0.05262016689007312) (-0.2111956685790341 -0.6440439452891952) (-0.15825570448686233 -0.8404981965955086) (-0.22873114405012082 -0.7437037378070539) (-0.7593270285722331 -0.07103760864333494) (-0.21341374698041712 -0.7929573980203964) (-1.14552857274046 -0.21203497253422757) (-0.017702618580807752 0.6441580986379779) (-1.3672716107432914 -0.03443937797020626) (0.3690894742998263 0.10580595033347262) (-1.2860607756463245 0.05472951149223637) (-0.7279152972482008 -0.1952638419617793) (0.36820063867726144 0.10586615456725897) (-0.24606932996439895 0.7580440310947352) (-0.17601672649223823 0.6611766622722745) (-0.6920546478365922 -0.3707484320864105) (0.37021522440254206 -0.5936583709182989) (-0.6253123542811174 0.40317786016173307) (0.14174502160514957 -0.6103102392671957) (-0.542856113536142 -0.5917582170004216) (-1.1186278320735663 -0.26326923099245986) (-0.06929031243595642 -0.8242369704835132) (-1.391337616740479 -0.01631602850208591) (-0.5760375733499883 -0.5745940609573207) (-0.5578468368419144 -0.6267438319505215) (-0.7430321028164721 -0.1605994817149329) (-1.1619094678449837 0.19328372313755246) (-1.1325134424951162 -0.21329385761321118) (-1.0421759390045935 0.2472658982853719) (-0.17703763443623138 -0.8561474030302187) (-0.6755887457983579 -0.45592841703921183) (0.2135336355719221 0.5427400617652326) (-0.7262865580803001 -0.17787834725766655) (-0.3004696923720396 -0.6594694228191598) (-0.9524259857299887 0.24678728171755948) (-0.1235398080145244 -0.83923974514271) (-0.8548395259721331 -0.2129341848617453) (-0.30035048292547034 0.6584448201827886) (0.14228625031498734 -0.6094489804713039) (0.315697579719134 -0.4914975131609299) (0.37098540452237033 -0.2821803306242197) (-0.9815704685103546 0.26350828544903576) (-0.9657913238941811 -0.24852219828723765) (0.333760346833827 0.3884254136364585) (-0.3702744710470992 0.642959371780778) (0.26571935710006056 -0.5759221043867195) (-0.5409410073162427 0.5425079523056977) (-0.8730347169909026 0.23082727613146017) (-0.6590709892928033 -0.422033593282675) (-0.035946362241334996 -0.709594890785085) (-1.2726855607994116 -0.052981773046891875) (-1.146072128278653 -0.28241907106726316) (0.3358406758130304 0.4042997628313072) (0.36897096723952255 -0.28194158607858105) (-0.3867693337455536 0.6257704658125348) (-0.035223012286277486 -0.6931858087531064) (-0.37033371735519455 0.6424455527979498) (-0.7097639874310477 0.3537534865412553) (-1.453829658970603 -0.0006631757618564277) (-1.2472030319831118 -0.07091710718421036) (-0.10472225773771106 0.9353304593260242) (-0.3683784118299813 0.6430164598583336) (-0.3518545019245609 -0.6592986691880321) (-1.21909196018644 -0.12335928676843197) (-0.30005245453384094 -0.6596401710570553) (-1.3132003444782012 -0.0717003620414088) (-0.5413472867633843 0.5407088368170473) (0.35327877117720785 0.43920342615521163) (-0.10526410790948179 0.8883333696600184) (0.28080749356738854 0.5751715051195471) (0.2815237732622842 0.4730299011702313) (-0.5262621364855082 -0.508288154761845) (0.01927005795330511 0.6437014711989587) (-0.7108347980038854 -0.22897071493245885) (-0.6768369856588892 0.35327877117720785) (-0.45616321882705574 0.5942340592410358) (-0.5750560204666069 0.45768926863764114) (-1.3150182727591284 -0.0691095546108894) (-0.6923940225422751 -0.3700967301042579) (0.12215578608404336 -0.5923340831420184) (0.3529227211699033 0.4223871732891309) (-1.0289393442620969 0.28158346157535025) (-0.6431306342605002 0.420265486394795) (-1.1333580525878935 0.21203497253422757) (-1.059137223513944 -0.26410590482170543) (-0.29909871790840975 -0.6425597388819166) (0.19484383283686568 0.558888883568764) (-1.059137223513944 0.26356804846470233) (-0.2649425316132464 0.6438156315692706) (0.3184357880451476 0.45616321882705574) (-1.2447979169668468 0.0546089791338282) (0.3335820156014083 -0.40317786016173307) (0.0895092489448939 -0.6085301670854236) (-0.2110158128327015 0.6438156315692706) (-0.6776878876537361 0.31665006912323823) (-0.7430321028164721 -0.12474325709777696) (-1.3404583516867494 -0.06947106969435768) (0.315697579719134 -0.49196501779801066) (-0.14252679304899954 -0.8574003647293239) (-0.45557620192969395 -0.5773653158344426) (-0.22938995596408446 0.8566922195895228) (-0.2822997013587828 -0.6425026461318485) (-0.26464374173965693 0.6446717597274327) (0.21143547355382072 0.5432622791931236) (-1.2452225629732931 -0.17835874036993712) (-1.273336546782854 -0.051535338138893286) (-0.19562384286396553 0.8095089067887999) (0.12305841578378629 -0.5937735129000938) (-0.0870398209916836 0.8722210052959244) (0.38854369448255455 -0.14246665755962717) (0.37116313030989695 -0.08908764886905968) (-1.2596355072176184 0.03703137832511354) (0.29832375565844543 -0.45727843669119256) (-0.5578468368419144 0.593428080481767) (0.35096424007510624 -0.5092210429605659) (-0.17661726619214296 0.8255001821783612) (0.10556513243743462 -0.6264575648661703) (0.3334631265974392 -0.05219829086569932) (-0.7100458022746403 -0.2470265917972147) (-0.15795520434031973 -0.8400605201449705) (-0.5258549758034907 -0.506888600832879) (-0.06989283441862332 -0.8231382034532069) (-1.1458250731971098 0.21329385761321118) (-0.9508882256800689 0.24804361952604975) (-1.2448922906650361 0.07001333805478432) (0.3010657232143354 0.4916143920009519) (-1.2463073529644162 -0.08746144015832989) (-0.3525666596175955 -0.6585586744987524) (-0.49167283075090773 -0.5254477917075596) (-1.14552857274046 -0.28343367209994735) (-0.26440470551187334 0.6445576169179453) (-0.6764965861043422 0.44049730426884615) (0.3707484320864105 0.15765470060550077) (-0.49173126905408926 0.6088747387054221) (-0.6439297895994878 0.4054215328767291) (0.40506730405462654 0.33304700554150674) (-1.0286808421608216 -0.2644644649293447) (-0.7578208638849782 -0.07025434456323001) (-0.4219157302119971 0.593485653899887) (-0.6261712835505506 -0.4031188089859839) (-0.6590709892928033 -0.42167999947042273) (-1.0589837964026783 -0.26571935710006056) (-0.47285416467679575 0.6273163233994065) (0.40483114414429516 -0.33459252313765087) (0.36944498742977516 0.2815237732622842) (-0.19604383582761503 0.8066963454695112) (-0.5602201482260559 -0.5588309963978517) (-1.2465430976187302 -0.06989283441862332) (-0.37021522440254206 -0.642160077372813) (-0.7271852415094535 0.17595667164165957) (-0.03455993744300719 -0.6930727039926105) (-0.9666359073359254 0.2481632655697906) (0.40288260062045556 -0.36867469372235284) (-0.5401864244560541 -0.5914126715015517) (-0.7276906766139808 0.21035632700953785) (0.3175429610455707 0.4914390730709699) (0.28337399174406563 -0.4732056337951629) (0.40418167405253136 0.14288760326357888) (-1.217801120830941 -0.1235398080145244) (-0.36867469372235284 -0.6437585516766006) (-0.7261180361220689 -0.19334372955830906) (0.26470350019554606 0.48904264550252685) (0.31581664491535316 -0.5773653158344426) (-0.2990391070568404 0.6434731434397102) (0.1763770522349924 0.5912398914964282) (-0.7257247951285475 0.19520384119008227) (-1.366567450071047 -0.03630803546093346) (-0.26380709813183023 0.6416461848502073) (-0.5065386708679707 -0.6081281417031839) (-0.50607207180758 -0.6105398872127406) (-0.6589571457516662 -0.43849759300488644) (-0.6766100550819557 -0.43879169712911614) (-0.5253314490964588 0.5234115206537892) (-0.7269605865027233 0.24834273294400477) (0.10484266955451226 0.6422742692937888) (-0.5239933719344 0.5234697079229886) (-0.7092566800850469 -0.247146245490448) (-0.7274098859437009 0.21173522544902412) (0.10496308099023886 0.6431877205850076) (-0.2995755949321321 0.643872710876917) (-0.49132219155141743 -0.6253123542811174) (-0.7255000714803014 -0.19442381503644868) (-0.7110038520510513 -0.2288509299071953) (-0.856365338992302 -0.23046795738665474) (-1.1474057756854266 0.21185512486068678) (-0.9196999107136248 -0.28098656693949753)
(0.352389 -0.421385) (0.334533 -0.403886) (-0.211675 0.643587) (-0.67627 0.351142)
(0.124442 -0.59291) (-0.949986 -0.248223) (0.37063 0.281285) (-1.176419 -0.22927)
(-0.299337 0.659925) (-0.74348 -0.106047) (-1.352745 -0.051475) (0.367964 -0.122156)
(-1.146369 -0.211915) (0.194964 0.558773) (-1.367712 -0.017039) (-0.982358 -0.263927)
(-1.116628 0.265958) (-0.87298 -0.230708) (-1.160142 -0.265779) (-0.228072 0.757709)
(-1.378435 -0.016195) (-0.62766 -0.386651) (0.282717 -0.472268) (-0.455928 0.593946)
(-0.035163 -0.775008) (-0.30035 -0.626858) (-0.437851 -0.574305) (0.265062 -0.48916)
(-0.708298 0.334414) (-1.044388 -0.247924) (-1.102149 0.228252) (0.351617 0.420148)
(-0.282001 0.643587) (-0.300529 0.644786) (-0.034922 -0.774507) (0.001688 0.79174)
(-0.193284 0.676099) (-0.642274 0.403296) (0.439733 -0.230947) (-0.675986 0.351142)
(0.334414 0.052319) (-0.212515 0.644386) (-1.37826 -0.016979) (0.352211 0.088244)
(-0.541463 -0.576961) (-0.405776 0.592276) (-0.034319 0.694204) (0.016557 0.643188)
(-0.265779 0.643016) (0.351498 0.508172) (-0.071399 0.824896) (-0.142527 0.857727)
(0.104481 -0.608817) (-0.421857 -0.592737) (-0.693977 0.368438) (-0.625083 0.457572)
(-0.175476 0.841428) (-0.540651 0.594119) (0.388307 -0.264704) (0.263508 0.490212)
(0.316531 -0.42115) (-0.57598 -0.472151) (0.122998 -0.593198) (-1.1023 0.230408) (-0.643759
-0.454813) (0.371163 0.160059) (-1.352434 -0.052982) (-1.245506 -0.070676) (-0.742416
0.122637) (-1.353411 0.053223) (-0.053645 -0.809399) (-0.228731 0.744263) (-1.147801
0.211256) (-0.559526 -0.559005) (0.404772 -0.194244) (0.350727 -0.420442) (-0.644101
-0.405185) (-0.692507 -0.368615) (-0.726399 0.282717) (-0.08716 0.871353) (-0.541173
0.608875) (0.35132 0.369978) (-0.872492 -0.229749) (-0.918575 -0.263807) (0.3179
-0.576211) (-0.054187 -0.824951) (-0.230109 -0.658502) (0.124683 0.658786) (-0.211855
0.792182) (-0.855548 0.211735) (-0.29886 0.642274) (0.175416 -0.593486) (-0.676043
-0.353753) (0.125225 -0.591125) (-0.228851 -0.711342) (-0.033957 0.658559) (-1.174224
0.230648) (-0.59147 -0.440321) (-0.370393 -0.659526) (-0.54216 -0.540593) (-0.658957
-0.42221) (-0.983408 -0.263389) (-1.118928 -0.265241) (-0.248343 0.809509) (-1.103105
-0.248163) (-0.001447 -0.822699) (-0.525739 0.610655) (0.335365 -0.577134) (-0.643587
0.49214) (-0.54332 -0.591989) (-1.245553 0.070977) (0.351855 -0.087823) (-0.840662
-0.194124) (-0.558773 0.559352) (-1.160339 0.266317) (0.388248 -0.142346) (0.299397
0.575864) (-0.140663 -0.838857) (0.10707 0.6264) (0.387065 0.368852) (0.369326 0.281763)
(0.386828 -0.369208) (-0.857128 0.210416) (-0.175777 0.661461) (-1.103205 -0.230288)
(-0.439792 -0.575056) (-0.47467 -0.591816) (-1.365731 -0.017642) (-0.472093 0.593658)
(-0.693751 -0.333285) (0.125225 0.591873) (-0.456809 0.591182) (-0.659071 0.421209)
(-0.123781 -0.840115) (-0.316233 0.626458) (0.335603 0.524342) (-0.658729 -0.404005)
(-1.247015 0.069652) (-0.725275 0.193764) (-0.300529 -0.660892) (-0.934211 0.247745)
(-1.244892 0.089329) (-1.117278 -0.263628) (-0.790854 0.140602) (-0.791131 0.141865)
(-0.489627 0.609564) (-0.017703 0.741353) (0.158316 -0.574941) (-0.421621 0.574479)
(-0.840006 -0.193104) (-0.089208 0.85582) (0.385409 -0.264524) (-0.540593 0.57725)
(-0.016376 -0.79102) (-0.982148 0.280628) (-0.474143 0.591816) (0.336078 -0.402705)
(0.334593 -0.051716) (-0.016617 0.743424) (-0.228252 -0.759215) (-1.042588 0.26309)
(-0.57546 -0.57471) (-0.7432 -0.12348) (-0.57471 -0.49214) (-0.473264 0.593601) (-0.30047
-0.660323) (-0.071881 0.824017) (-1.219283 -0.141023) (-0.72668 -0.247086) (0.370511
-0.089991) (-0.577077 0.472093) (-0.421209 0.574594) (-0.017341 0.7432) (0.016015
0.642446) (-0.727129 -0.212455) (-0.420442 -0.593774) (-0.263389 -0.644729) (0.335425
-0.557673) (0.017883 0.642902) (-0.643302 -0.404713) (0.001326 0.80791) (0.334414
-0.506539) (-0.212515 -0.643759) (-0.177818 0.839021) (-0.744375 -0.087943) (0.334533
0.508346) (-0.369445 -0.642959) (-0.405185 -0.593831) (-0.525855 0.611114) (-0.676099
0.316531) (-0.386769 0.627717) (-0.159638 0.839294) (-0.300052 0.658445) (0.282419
-0.47221) (-0.017039 0.79102) (-0.157895 0.841483) (-0.574536 0.456222) (-0.439674
-0.577308) (-1.118328 0.263688) (-0.017039 -0.710778) (-0.263986 -0.659583) (-0.175596
0.660721) (-0.053705 0.677177) (-1.245647 0.090051) (0.352033 -0.385764) (-0.904536
-0.264405) (-0.591931 -0.455107) (-0.071339 0.66129) (-0.693695 -0.353516) (-0.541637
-0.57725) (-0.742248 -0.143128) (-1.260244 0.034982) (0.350964 -0.351439) (-0.644158
-0.474201) (0.318436 -0.575807) (-0.71044 0.246787) (-1.417531 -0.000723) (-0.420501
-0.591643) (-0.743592 0.104722) (0.316233 0.574363) (-0.489335 0.608875) (-1.354476
0.054127) (-0.001085 0.641875) (0.142467 -0.626286) (-1.260572 -0.03667) (-0.405422
0.592852) (-0.540825 -0.543436) (-1.365334 0.035826) (-0.22939 0.642274) (-1.260431
-0.036127) (0.053283 0.659242) (-0.265122 -0.643701) (-0.642274 0.40554) (0.333879
0.387893) (-0.742808 0.104722) (-0.422859 0.611229) (-0.001507 -0.757709) (-0.710215
0.335246) (0.141986 0.627889) (-0.658388 0.404654) (-0.052982 0.824621) (-0.194724
0.675248) (-1.367008 0.016859) (0.386178 -0.387183) (0.318555 0.576557) (-0.087341
-0.857291) (-1.058523 0.266018) (-0.541637 -0.577019) (0.369386 0.370097) (-1.314609
0.070917) (-0.054067 -0.825171) (0.001507 0.759829) (-0.175716 0.661404) (-0.001568
-0.824731) (-0.210836 -0.791131) (-0.559641 -0.643987) (-1.145874 -0.281404) (-0.141986
0.886929) (-0.263449 -0.644729) (0.351261 -0.367904) (0.333344 -0.388485) (-0.036187
-0.71044) (0.245591 0.55941) (-0.05256 0.840772) (-0.508521 -0.523412) (-0.228132
0.693073) (0.335662 0.507297) (0.298383 0.457455) (-0.59314 0.661063) (-0.856583
-0.210476) (-0.952267 0.247086) (-0.525157 0.626343) (-0.643759 -0.457455) (0.334711
0.421385) (-0.053584 -0.675475) (-0.140783 -0.888441) (-1.160093 0.298503) (-0.157835
0.839842) (-1.189914 0.248642) (-0.952108 -0.245591) (-0.727747 0.281942) (-1.31411
0.070435) (-0.473791 0.591816) (-0.950623 -0.246488) (-0.0345 0.776119) (0.158676
-0.576095) (-0.088064 0.871353) (0.264166 0.574998) (-0.016075 -0.791131) (-0.053946
0.824786) (-0.017823 0.709144) (0.229869 -0.523295) (-0.626171 0.386237) (-1.086777
-0.247206) (-0.48951 0.608186) (-0.576269 -0.489043) (-1.218088 0.142046) (0.016497
-0.643473) (-0.229809 0.711173) (-0.676497 -0.439145) (-1.176712 -0.230528) (-0.727915
-0.210476) (-1.161222 -0.194484) (-0.229689 0.642388) (0.142467 0.609219) (-0.744095
-0.141384) (-0.840389 0.230947) (0.08963 0.609621) (-0.298085 0.659754) (-1.274173
0.053705) (0.194004 0.557847) (-0.523586 0.609908) (0.298443 0.576211) (0.335603
0.053223) (-0.677971 -0.352033) (-0.949933 0.248223) (-0.22945 0.759327) (-1.217849
-0.16072) (0.248702 0.574883) (-0.726062 0.247505) (-0.22945 -0.642388) (-0.982358
-0.299278) (0.35138 -0.351202) (0.371104 0.090051) (-0.016015 0.743032) (-0.951896
-0.247206) (0.351024 -0.506655) (0.333344 -0.575864) (-0.035766 -0.710497) (-0.726736
-0.193944) (-1.746565 0.01933) (-1.102753 0.228671) (-1.161419 0.195924) (0.368793
0.104722) (-0.708467 -0.335187) (-0.212634 -0.694034) (-0.386947 -0.659526) (-1.147011
-0.283016) (-0.370037 -0.644786) (0.300231 0.455576) (0.299397 0.455165) (-0.642274
-0.4043) (0.159518 -0.576788) (-0.035645 0.71106) (0.317186 0.422623) (-0.405717
-0.592622) (0.210836 -0.540651) (-0.300708 -0.644329) (0.107191 0.62703) (-0.726118
0.247685) (-0.490855 -0.608875) (-0.211076 0.824457) (-1.247109 0.0871) (-0.177158
-0.659811) (-0.017642 0.792791) (0.018426 -0.642788) (-1.3527 -0.052319) (0.405303
0.333879) (-0.857291 0.230169) (-0.658673 0.437615) (-1.246637 -0.06911) (-0.576846
0.491439) (-0.421444 0.592622) (-0.178299 0.839404) (-0.283434 0.64393) (-1.245741
-0.054368) (-1.145825 0.283255) (-0.104782 0.839185) (0.368793 0.090051) (0.266257
0.574594) (0.388485 0.371045) (-1.779524 0.001568) (-0.727298 -0.248702) (-0.905019
-0.266197) (-1.219283 0.122998) (0.403355 -0.368675) (0.404654 -0.142647) (-0.85484
0.213294) (-0.543378 -0.542566) (-0.158556 -0.839732) (0.350608 0.385705) (-0.318733
-0.62766) (-0.019089 -0.74208) (-0.558715 0.55912) (-0.75955 0.06917) (-0.742696 -0.105204)
(-0.710328 -0.351855) (-0.726567 0.212874) (-0.195564 -0.676383) (-0.934211 0.263389)
(-0.472678 -0.591701) (-1.218996 -0.141565) (-0.489803 -0.609219) (0.318138 -0.422387)
(-0.231067 0.741297) (0.264704 -0.490212) (-0.070556 -0.823138) (0.192744 -0.560162)
(0.178419 -0.575345) (0.368615 0.123179) (-0.759104 -0.069712) (0.069471 -0.644386)
(-0.56022 0.608071) (-0.282419 -0.644501) (-1.274498 0.051475) (-0.726118 -0.282777)
(-0.369682 -0.642217) (-0.230288 0.744095) (-0.593831 -0.660323) (-0.421091 -0.59124)
(-0.557847 0.558194) (-0.228551 0.644329) (-0.725107 0.193824) (-0.70858 -0.24595)
(-0.018486 -0.743144) (0.245471 0.576211) (-0.490095 0.525913) (-0.017763 0.710835)
(-0.159638 0.839076) (-0.67627 0.315995) (-0.142286 0.888225) (0.089208 -0.610942)
(-1.245506 0.087763) (-0.018426 0.641875) (-0.710722 -0.22933) (-1.028526 0.281882)
(-0.016075 -0.743256) (-0.471858 -0.593428) (-0.053886 -0.677121) (-1.779414 0.000301)
(-0.592046 -0.440086) (0.388071 0.157534) (0.159758 -0.576442) (0.315638 -0.421739)
(-0.053163 -0.839896) (-0.03667 -0.692394) (0.333701 -0.387065) (-0.677745 0.473557)
(-0.677858 0.316531) (0.124563 -0.643131) (0.38813 -0.159999) (-1.146714 0.212215)
(-0.743928 -0.104481) (-1.132464 -0.26548) (-0.792127 -0.141023) (-0.036609 -0.643873)
(-1.118028 -0.264943) (-0.489569 -0.60899) (0.158736 -0.575229) (-0.104542 0.888225)
(-0.857455 0.211136) (-0.210356 0.791352) (-0.369563 0.643416) (-0.903352 -0.264106)
(-0.525739 -0.508405) (-0.195264 -0.807689) (-1.041867 -0.247206) (0.106649 0.626973)
(-0.471975 0.594119) (0.318198 -0.456105) (0.368378 0.298145) (-1.247062 0.088967)
(0.318614 0.50683) (-0.176557 -0.839896) (0.158616 0.574594) (0.318555 -0.593371)
(-0.051475 0.808682) (-0.541696 0.591528) (-0.676383 -0.352923) (-0.08704 -0.857836)
(-0.576269 0.576673) (0.318436 0.491088) (0.386888 -0.177038) (-1.103507 0.228671)
(-1.013719 0.280569) (0.035283 0.627545) (-0.016497 -0.790577) (-1.146665 0.212275)
(0.351558 -0.352211) (-0.054368 0.841756) (-0.658957 -0.40306) (-1.259823 -0.089931)
(-1.247109 -0.088004) (-0.627545 -0.388425) (-0.792791 0.142948) (-0.420914 -0.591873)
(-1.042073 -0.248462) (-1.274127 0.054127) (-1.162498 -0.265421) (-1.059035 0.26309)
(0.387243 0.368615) (0.141805 0.643302) (0.300768 0.455107) (0.281822 0.472561)
(-1.116278 0.264464) (-0.228132 0.809344) (-0.177518 0.825281) (0.386119 -0.264823)
(-0.791629 -0.16078) (-0.369919 0.659014)))


(define (draworb o)
  (let ((cuhluhr "white"))
    (define (inner_draw orbit orbcolor)
      (if (null? (cdr orbit))
        (pixel  (* (quotient height zoom) (car (cdr (car orbit)))) (- (- (quotient width 5)) (* (quotient width zoom) (car (car orbit)))) orbcolor)
        (begin (pixel  (* (quotient height zoom) (car (cdr (car orbit)))) (- (- (quotient width 5)) (* (quotient width zoom) (car (car orbit)))) orbcolor) (inner_draw (cdr orbit) orbcolor))
      )
    )
    (inner_draw o cuhluhr)
  )
)

(define (test in n)
    (if (= n 0)
      (draworb (orbitof (car in)))
      (begin (draworb (orbitof (candr in n))) (test in (- n 1)))
    )
)

(define (draw)
  (ht)
  (bgcolor "black")
  (pixelsize px)
  (test inputs 699)

  ;(exitonclick)

)

; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)

;
