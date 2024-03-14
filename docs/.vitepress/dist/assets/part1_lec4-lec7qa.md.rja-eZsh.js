import{_ as s,c as i,o as a,a4 as n}from"./chunks/framework.DxPg2OQI.js";const t="/CS-61A-Fall-2020/assets/cs61a_218.D5VTp0gp.png",e="/CS-61A-Fall-2020/assets/cs61a_219.DKZNo3XU.png",l="/CS-61A-Fall-2020/assets/cs61a_220.D3vbIkSA.png",h="/CS-61A-Fall-2020/assets/cs61a_221.DFXopu2a.png",p="/CS-61A-Fall-2020/assets/cs61a_222.BTjwxuph.png",k="/CS-61A-Fall-2020/assets/cs61a_223.C5iDVGpH.png",r="/CS-61A-Fall-2020/assets/cs61a_224.C9PPmKmB.png",d="/CS-61A-Fall-2020/assets/cs61a_225.5ah6zmcs.png",D=JSON.parse('{"title":"Lecture 4 --- Lecture 7 Q&A","description":"","frontmatter":{},"headers":[],"relativePath":"part1/lec4-lec7qa.md","filePath":"part1/lec4-lec7qa.md","lastUpdated":1710357288000}'),o={name:"part1/lec4-lec7qa.md"},g=n('<h1 id="lecture-4-lecture-7-q-a" tabindex="-1">Lecture 4 --- Lecture 7 Q&amp;A <a class="header-anchor" href="#lecture-4-lecture-7-q-a" aria-label="Permalink to &quot;Lecture 4 --- Lecture 7 Q&amp;A&quot;">​</a></h1><h2 id="lecture-4-higher-order-functions" tabindex="-1">Lecture 4 Higher-Order Functions <a class="header-anchor" href="#lecture-4-higher-order-functions" aria-label="Permalink to &quot;Lecture 4 Higher-Order Functions&quot;">​</a></h2><h3 id="_1" tabindex="-1">1 <a class="header-anchor" href="#_1" aria-label="Permalink to &quot;1&quot;">​</a></h3><p>John提到设计函数时需要注意的几点</p><blockquote><ul><li>Give each function exactly one job</li><li>Don&#39;t repeat yourself (DRY). Implement a process just once, but execute it many times.</li><li>Define functions generally.</li></ul></blockquote><ul><li>确保每个函数只做一个事情。</li><li>避免重复代码（遵循DRY原则）。将一个过程实现一次，然后多次执行它。</li><li>定义通用的函数。</li></ul><h3 id="_2" tabindex="-1">2 <a class="header-anchor" href="#_2" aria-label="Permalink to &quot;2&quot;">​</a></h3><p><img src="'+t+'" alt="cs61a_218" loading="lazy"></p><p><code>assert</code> 语句，如果 <code>assert</code> 之后表达式的值为假，那么就会报错，并显示对应的信息，如上图</p><h3 id="_3" tabindex="-1">3 <a class="header-anchor" href="#_3" aria-label="Permalink to &quot;3&quot;">​</a></h3><p>John演示 <code>def</code> 创建出来的函数有固有的名字，而 <code>lambda</code> 创建出来的函数没有</p><p><img src="'+e+'" alt="cs61a_219" loading="lazy"></p><p><img src="'+l+'" alt="cs61a_220" loading="lazy"></p><h3 id="_4" tabindex="-1">4 <a class="header-anchor" href="#_4" aria-label="Permalink to &quot;4&quot;">​</a></h3><p><img src="'+h+`" alt="cs61a_221" loading="lazy"></p><p><code>if</code> 语句只会执行 <code>if</code> 或者 <code>else</code> 语句中的一个，而另一个不会被执行，</p><p>而如果像上图一样定义一个类似于 <code>if</code> 语句的函数，并把表达式放在参数中，那么<strong>两个表达式都会被<mark>执行</mark></strong>，而<strong>传入的是表达式的结果/对应的值</strong></p><h3 id="_5" tabindex="-1">5 <a class="header-anchor" href="#_5" aria-label="Permalink to &quot;5&quot;">​</a></h3><p><code>and</code> 和 <code>or</code> 语句，</p><p><code>and</code> / <code>or</code> 语句中，如果靠前的表达式结果计算为假/真，那么就会返回<strong>这个结果</strong>，而靠后的表达式就不再会执行，而如果所有表达式全对应为真/假，那么就会返回最后表达式的结果</p><h3 id="_6" tabindex="-1">6 <a class="header-anchor" href="#_6" aria-label="Permalink to &quot;6&quot;">​</a></h3><p><code>... if ... else ...</code> 语句(感觉很像c语言中的三目运算符)，</p><p>判断条件在中间，为真就执行左边的表达式并返回，为假就是右边</p><h2 id="project-hog" tabindex="-1">Project Hog <a class="header-anchor" href="#project-hog" aria-label="Permalink to &quot;Project Hog&quot;">​</a></h2><h3 id="_1-1" tabindex="-1">1 <a class="header-anchor" href="#_1-1" aria-label="Permalink to &quot;1&quot;">​</a></h3><p>Problem 7，这题需要实现 <code>announce_highest</code> 函数，返回一个函数，</p><p>这题可以参考已经实现好的 <code>annouce_lead_changes</code> 函数，代码的结构和这个函数大致相同</p><details class="details custom-block"><summary>代码</summary><div class="language-python vp-adaptive-theme"><button title="Copy Code" class="copy"></button><span class="lang">python</span><pre class="shiki shiki-themes github-light github-dark vp-code"><code><span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">def</span><span style="--shiki-light:#6F42C1;--shiki-dark:#B392F0;"> announce_highest</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">(who, last_score</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">=</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">0</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">, running_high</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">=</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">0</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">):</span></span>
<span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">    assert</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> who </span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">==</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;"> 0</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;"> or</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> who </span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">==</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;"> 1</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">, </span><span style="--shiki-light:#032F62;--shiki-dark:#9ECBFF;">&#39;The who argument should indicate a player.&#39;</span></span>
<span class="line"><span style="--shiki-light:#6A737D;--shiki-dark:#6A737D;">    # BEGIN PROBLEM 7</span></span>
<span class="line"><span style="--shiki-light:#032F62;--shiki-dark:#9ECBFF;">    &quot;*** YOUR CODE HERE ***&quot;</span></span>
<span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">    def</span><span style="--shiki-light:#6F42C1;--shiki-dark:#B392F0;"> say</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">(score0, score1):</span></span>
<span class="line"><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">        gain </span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">=</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> (score0 </span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">if</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;"> not</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> who </span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">else</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> score1) </span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">-</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> last_score</span></span>
<span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">        if</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> gain </span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">&gt;</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> running_high:</span></span>
<span class="line"><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">            print</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">(gain, </span><span style="--shiki-light:#032F62;--shiki-dark:#9ECBFF;">&quot;point(s)! The most yet for Player&quot;</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">, who)</span></span>
<span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">        return</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> announce_highest(who, last_score </span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">+</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> gain, gain </span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">if</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> gain </span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">&gt;</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> running_high </span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">else</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> running_high)</span></span>
<span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">    return</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> say</span></span>
<span class="line"><span style="--shiki-light:#6A737D;--shiki-dark:#6A737D;">    # END PROBLEM 7</span></span></code></pre></div></details><h3 id="_2-1" tabindex="-1">2 <a class="header-anchor" href="#_2-1" aria-label="Permalink to &quot;2&quot;">​</a></h3><p>Problem 8中提到，可以使用 <code>*args</code> 来传入和使用不定个数的参数</p><blockquote><p>Instead of listing formal parameters for a function, you can write <code>*args</code> . To call another function using exactly those arguments, you call it again with <code>*args</code> . For example,</p><div class="language-python vp-adaptive-theme"><button title="Copy Code" class="copy"></button><span class="lang">python</span><pre class="shiki shiki-themes github-light github-dark vp-code"><code><span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">&gt;&gt;&gt;</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;"> def</span><span style="--shiki-light:#6F42C1;--shiki-dark:#B392F0;"> printed</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">(f):</span></span>
<span class="line"><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">...</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">     def</span><span style="--shiki-light:#6F42C1;--shiki-dark:#B392F0;"> print_and_return</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">(</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">*</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">args):</span></span>
<span class="line"><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">...</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">         result </span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">=</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> f(</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">*</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">args)</span></span>
<span class="line"><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">...</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">         print</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">(</span><span style="--shiki-light:#032F62;--shiki-dark:#9ECBFF;">&#39;Result:&#39;</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">, result)</span></span>
<span class="line"><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">...</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">         return</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> result</span></span>
<span class="line"><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">...</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">     return</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> print_and_return</span></span>
<span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">&gt;&gt;&gt;</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> printed_pow </span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">=</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> printed(</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">pow</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">)</span></span>
<span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">&gt;&gt;&gt;</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> printed_pow(</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">2</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">, </span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">8</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">)</span></span>
<span class="line"><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">Result: </span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">256</span></span>
<span class="line"><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">256</span></span>
<span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">&gt;&gt;&gt;</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> printed_abs </span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">=</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> printed(</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">abs</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">)</span></span>
<span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">&gt;&gt;&gt;</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> printed_abs(</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">-</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">10</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">)</span></span>
<span class="line"><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">Result: </span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">10</span></span>
<span class="line"><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">10</span></span></code></pre></div></blockquote><details class="details custom-block"><summary>代码</summary><div class="language-python vp-adaptive-theme"><button title="Copy Code" class="copy"></button><span class="lang">python</span><pre class="shiki shiki-themes github-light github-dark vp-code"><code><span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">def</span><span style="--shiki-light:#6F42C1;--shiki-dark:#B392F0;"> make_averaged</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">(original_function, trials_count</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">=</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">1000</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">):</span></span>
<span class="line"><span style="--shiki-light:#6A737D;--shiki-dark:#6A737D;">    # BEGIN PROBLEM 8</span></span>
<span class="line"><span style="--shiki-light:#032F62;--shiki-dark:#9ECBFF;">    &quot;*** YOUR CODE HERE ***&quot;</span></span>
<span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">    def</span><span style="--shiki-light:#6F42C1;--shiki-dark:#B392F0;"> averaged</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">(</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">*</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">args):</span></span>
<span class="line"><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">        i </span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">=</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;"> 0</span></span>
<span class="line"><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">        sum</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;"> =</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;"> 0</span></span>
<span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">        while</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> i </span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">&lt;</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> trials_count:</span></span>
<span class="line"><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">            sum</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;"> +=</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> original_function(</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">*</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">args)</span></span>
<span class="line"><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">            i </span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">+=</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;"> 1</span></span>
<span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">        return</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;"> sum</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;"> /</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> trials_count</span></span>
<span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">    return</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> averaged</span></span>
<span class="line"><span style="--shiki-light:#6A737D;--shiki-dark:#6A737D;">    # END PROBLEM 8</span></span></code></pre></div></details><h3 id="_3-1" tabindex="-1">3 <a class="header-anchor" href="#_3-1" aria-label="Permalink to &quot;3&quot;">​</a></h3><p>Problem 9中需要使用Problem 8中实现的 <code>make_averaged</code> 来 <strong><mark>避免代码的重复</mark></strong></p><details class="details custom-block"><summary>代码</summary><div class="language-python vp-adaptive-theme"><button title="Copy Code" class="copy"></button><span class="lang">python</span><pre class="shiki shiki-themes github-light github-dark vp-code"><code><span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">def</span><span style="--shiki-light:#6F42C1;--shiki-dark:#B392F0;"> max_scoring_num_rolls</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">(dice</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">=</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">six_sided, trials_count</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">=</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">1000</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">):</span></span>
<span class="line"><span style="--shiki-light:#6A737D;--shiki-dark:#6A737D;">    # BEGIN PROBLEM 9</span></span>
<span class="line"><span style="--shiki-light:#032F62;--shiki-dark:#9ECBFF;">    &quot;*** YOUR CODE HERE ***&quot;</span></span>
<span class="line"><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">    best_nums_rolls </span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">=</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;"> 0</span></span>
<span class="line"><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">    max_average_score </span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">=</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;"> 0</span></span>
<span class="line"><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">    averaged_roll_dice </span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">=</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> make_averaged(roll_dice, trials_count)</span></span>
<span class="line"><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">    i </span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">=</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;"> 1</span></span>
<span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">    while</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> i </span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">&lt;=</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;"> 10</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">:</span></span>
<span class="line"><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">        average_score </span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">=</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> averaged_roll_dice(i, dice)</span></span>
<span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">        if</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> average_score </span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">&gt;</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> max_average_score:</span></span>
<span class="line"><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">            max_average_score </span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">=</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> average_score</span></span>
<span class="line"><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">            best_nums_rolls </span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">=</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> i</span></span>
<span class="line"><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">        i </span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">+=</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;"> 1</span></span>
<span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">    return</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> best_nums_rolls</span></span>
<span class="line"><span style="--shiki-light:#6A737D;--shiki-dark:#6A737D;">    # END PROBLEM 9</span></span></code></pre></div></details><h2 id="lecture-5-environments" tabindex="-1">Lecture 5 Environments <a class="header-anchor" href="#lecture-5-environments" aria-label="Permalink to &quot;Lecture 5 Environments&quot;">​</a></h2><h3 id="_1-2" tabindex="-1">1 <a class="header-anchor" href="#_1-2" aria-label="Permalink to &quot;1&quot;">​</a></h3><p>John提到<em>框架 frame</em></p><blockquote><ul><li>Every user-defined function has a parent frame (often global)</li><li>The parent of a function is the frame in which it was defined</li><li>Every local frame has a parent frame (often global)</li><li>The parent of a frame is the parent of the function called</li></ul></blockquote><ul><li>每个自定义函数都有一个母框架(通常是全局框架)</li><li>函数的父级就是它被定义时所处的框架</li><li>每个本地框架都有一个母框架(通常是全局框架)</li><li>框架的父级是被调用函数的父级</li></ul><h2 id="lecture-6-design" tabindex="-1">Lecture 6 Design <a class="header-anchor" href="#lecture-6-design" aria-label="Permalink to &quot;Lecture 6 Design&quot;">​</a></h2><h3 id="_1-3" tabindex="-1">1 <a class="header-anchor" href="#_1-3" aria-label="Permalink to &quot;1&quot;">​</a></h3><p><img src="`+p+'" alt="cs61a_222" loading="lazy"></p><p>John提到如何对函数以及变量命名，分别举出了正反例</p><hr><p><img src="'+k+`" alt="cs61a_223" loading="lazy"></p><p>John指出了什么样的东西值得去命名，以及命名时(更多的)一些注意点</p><h2 id="lecture-6-q-a" tabindex="-1">Lecture 6 Q&amp;A <a class="header-anchor" href="#lecture-6-q-a" aria-label="Permalink to &quot;Lecture 6 Q&amp;A&quot;">​</a></h2><h3 id="_1-4" tabindex="-1">1 <a class="header-anchor" href="#_1-4" aria-label="Permalink to &quot;1&quot;">​</a></h3><p>John在演示时使用了 <code>round</code> 这个函数，作用是能四舍五入取整/去掉剩余的位数，</p><p>第一个参数传入需要取整的数，第二个参数表示取到第几位小数，例如</p><div class="language-python vp-adaptive-theme"><button title="Copy Code" class="copy"></button><span class="lang">python</span><pre class="shiki shiki-themes github-light github-dark vp-code"><code><span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">&gt;&gt;&gt;</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;"> 1</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">/</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">3</span></span>
<span class="line"><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">0.3333333333333333</span></span>
<span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">&gt;&gt;&gt;</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;"> round</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">(</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">1</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">/</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">3</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">, </span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">4</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">)</span></span>
<span class="line"><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">0.3333</span></span>
<span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">&gt;&gt;&gt;</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;"> 2</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">/</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">3</span></span>
<span class="line"><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">0.6666666666666666</span></span>
<span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">&gt;&gt;&gt;</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;"> round</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">(</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">2</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">/</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">3</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">, </span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">5</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">)</span></span>
<span class="line"><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">0.66667</span></span></code></pre></div><h2 id="lecture-7-function-examples" tabindex="-1">Lecture 7 Function Examples <a class="header-anchor" href="#lecture-7-function-examples" aria-label="Permalink to &quot;Lecture 7 Function Examples&quot;">​</a></h2><h3 id="_1-5" tabindex="-1">1 <a class="header-anchor" href="#_1-5" aria-label="Permalink to &quot;1&quot;">​</a></h3><p><em>函数修饰符 Function Decorator</em></p><p><img src="`+r+'" alt="cs61a_224" loading="lazy"></p><p>如果在某个函数定义时， <code>@</code> 另一个已有的函数，就会把这个函数名对应的变量绑定成被 <code>@</code> 的函数传入这个函数后的返回值，</p><p>例如下图中John的demo演示</p><p><img src="'+d+`" alt="cs61a_225" loading="lazy"></p><h2 id="lecture-7-q-a" tabindex="-1">Lecture 7 Q&amp;A <a class="header-anchor" href="#lecture-7-q-a" aria-label="Permalink to &quot;Lecture 7 Q&amp;A&quot;">​</a></h2><h3 id="_1-6" tabindex="-1">1 <a class="header-anchor" href="#_1-6" aria-label="Permalink to &quot;1&quot;">​</a></h3><p>有人提问18秋季第一次期中考试的第6题的a题</p><div class="info custom-block"><p class="custom-block-title">引述</p><p><strong>This Again?</strong></p><p><strong>Definitions.</strong> A <em>repeatable integer</em> function takes an integer argument and returns a repeatable integer function.</p><p><strong>(a) (6 pt)</strong> Implement <code>repeat</code> , which is a repeatable integer function that detects repeated arguments. As a side effect of repeated calls, it prints each argument that has been used before in a sequence of repeated calls. Therefore, if an argument appears <em>n</em> times, it is printed <em>n</em> − 1 times in total, each time other than the first. The <code>detector</code> function is part of the implementation of <code>repeat</code> ; you must determine how it is used.</p><p><strong>Important: You may</strong> <u><strong>not</strong></u> <strong>use a list, set, or any other data type not covered yet in the course.</strong></p><div class="language-python vp-adaptive-theme"><button title="Copy Code" class="copy"></button><span class="lang">python</span><pre class="shiki shiki-themes github-light github-dark vp-code"><code><span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">def</span><span style="--shiki-light:#6F42C1;--shiki-dark:#B392F0;"> repeat</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">(k):</span></span>
<span class="line"><span style="--shiki-light:#032F62;--shiki-dark:#9ECBFF;">    &quot;&quot;&quot;When called repeatedly, print each repeated argument.</span></span>
<span class="line"></span>
<span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">    &gt;&gt;&gt; </span><span style="--shiki-light:#032F62;--shiki-dark:#9ECBFF;">f = repeat(1)(7)(7)(3)(4)(2)(5)(1)(6)(5)(1) </span></span>
<span class="line"><span style="--shiki-light:#032F62;--shiki-dark:#9ECBFF;">    7</span></span>
<span class="line"><span style="--shiki-light:#032F62;--shiki-dark:#9ECBFF;">    1</span></span>
<span class="line"><span style="--shiki-light:#032F62;--shiki-dark:#9ECBFF;">    5</span></span>
<span class="line"><span style="--shiki-light:#032F62;--shiki-dark:#9ECBFF;">    1</span></span>
<span class="line"><span style="--shiki-light:#032F62;--shiki-dark:#9ECBFF;">    &quot;&quot;&quot;</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> </span></span>
<span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">    return</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> _____________________________________________________________________________(k) </span></span>
<span class="line"></span>
<span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">def</span><span style="--shiki-light:#6F42C1;--shiki-dark:#B392F0;"> detector</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">(f): </span></span>
<span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">    def</span><span style="--shiki-light:#6F42C1;--shiki-dark:#B392F0;"> g</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">(i): </span></span>
<span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">        if</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> ________________________________________________________________________________: </span></span>
<span class="line"><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">            _______________________________________________________________________________ </span></span>
<span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">        return</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> ____________________________________________________________________________ </span></span>
<span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">    return</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> g</span></span></code></pre></div></div><p>尝试自己做了一下，</p><p>由于 <code>detector</code> 的参数是 <code>f</code> ，所以想到应该是通过这个函数 <code>f</code> 来记录 <code>repeat</code> 传入过的参数，</p><p>而每次调用 <code>g</code> 时，应该是返回一个新的 <code>g</code> (这样才能重复调用)，所以 <code>g</code> 最后 <code>return</code> 时应该要调用 <code>detector</code> 来更新记录的信息，那么 <code>g</code> 中大概就可以得到</p><div class="language-python vp-adaptive-theme"><button title="Copy Code" class="copy"></button><span class="lang">python</span><pre class="shiki shiki-themes github-light github-dark vp-code"><code><span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">def</span><span style="--shiki-light:#6F42C1;--shiki-dark:#B392F0;"> g</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">(i):</span></span>
<span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">    if</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> f(i):</span></span>
<span class="line"><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">        print</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">(i)</span></span>
<span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">    return</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> detector(</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">...</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">)</span></span></code></pre></div><p>而 <code>repeat</code> 中，应该是最初始的状态，所以应该给 <code>detector</code> 传入没有信息的函数 <code>lambda x: False</code> ，因此 <code>g</code> 中要给 <code>detector</code> 传入的函数就是需要添加当前的 <code>i</code> 就行了</p><details class="details custom-block"><summary>代码</summary><div class="language-python vp-adaptive-theme"><button title="Copy Code" class="copy"></button><span class="lang">python</span><pre class="shiki shiki-themes github-light github-dark vp-code"><code><span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">def</span><span style="--shiki-light:#6F42C1;--shiki-dark:#B392F0;"> repeat</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">(k):</span></span>
<span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">    return</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> detector(</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">lambda</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> x: </span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">False</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">)(k) </span></span>
<span class="line"></span>
<span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">def</span><span style="--shiki-light:#6F42C1;--shiki-dark:#B392F0;"> detector</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">(f): </span></span>
<span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">    def</span><span style="--shiki-light:#6F42C1;--shiki-dark:#B392F0;"> g</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">(i): </span></span>
<span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">        if</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> f(i): </span></span>
<span class="line"><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">            print</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">(i) </span></span>
<span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">        return</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> detector(</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">lambda</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> x: x </span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">==</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> i </span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">or</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> f(x)) </span></span>
<span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">    return</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> g</span></span></code></pre></div></details>`,69),c=[g];function E(_,y,F,u,m,C){return a(),i("div",null,c)}const f=s(o,[["render",E]]);export{D as __pageData,f as default};
