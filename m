From: Prabhakar Lad <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/2] DaVinci: GPIO: fixes
Date: Mon, 11 Nov 2013 21:19:51 +0530
Message-ID: <CA+V-a8vKD7gReQYp8C4rAgek8TsvSjDNHYU3X8rgGMMoh6hG=Q@mail.gmail.com>
References: <1383893156-28010-1-git-send-email-prabhakar.csengg@gmail.com>
	<5280FB19.4020204@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0928212131=="
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <5280FB19.4020204-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Cc: DLOS <davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LAK <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

--===============0928212131==
Content-Type: multipart/alternative; boundary="f46d044280cab43b3204eae8ae21"

--f46d044280cab43b3204eae8ae21
Content-Type: text/plain; charset="ISO-8859-1"

Hi Grygorii,

On 11 Nov 2013 21:16, "Grygorii Strashko" <grygorii.strashko-l0cyMroinI0@public.gmane.org> wrote:
>
> Hi Sekhar, Prabhakar Lad
>
> On 11/08/2013 08:45 AM, Prabhakar Lad wrote:> From: "Lad, Prabhakar" <
prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >
> > This patch series fixes gpio driver regestration
> > and offset check for unbanked gpio.
> >
> > Lad, Prabhakar (2):
> >    gpio: davinci: Fix a check for unbanked gpio
> >    ARM: davinci: Fix number of resources passed to
> >      davinci_gpio_register() call
>
> I've verified both patches - looks ok.
> Patch 1 - restores unbanked GPIO IRQs functionality
> Patch 2 - allows to register GPIO Platform devices and boot without
issues.
>
> Could we move forward with these patches?
>
Can you ACk the patches ?

Regards,
--Prabhakar

--f46d044280cab43b3204eae8ae21
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Hi Grygorii,</p>
<p dir=3D"ltr">On 11 Nov 2013 21:16, &quot;Grygorii Strashko&quot; &lt;<a h=
ref=3D"mailto:grygorii.strashko-l0cyMroinI0@public.gmane.org">grygorii.strashko-l0cyMroinI0@public.gmane.org</a>&gt; wr=
ote:<br>
&gt;<br>
&gt; Hi Sekhar, Prabhakar Lad<br>
&gt;<br>
&gt; On 11/08/2013 08:45 AM, Prabhakar Lad wrote:&gt; From: &quot;Lad, Prab=
hakar&quot; &lt;<a href=3D"mailto:prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">prabhakar.cse=
ngg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; This patch series fixes gpio driver regestration<br>
&gt; &gt; and offset check for unbanked gpio.<br>
&gt; &gt;<br>
&gt; &gt; Lad, Prabhakar (2):<br>
&gt; &gt; =A0 =A0gpio: davinci: Fix a check for unbanked gpio<br>
&gt; &gt; =A0 =A0ARM: davinci: Fix number of resources passed to<br>
&gt; &gt; =A0 =A0 =A0davinci_gpio_register() call<br>
&gt;<br>
&gt; I&#39;ve verified both patches - looks ok.<br>
&gt; Patch 1 - restores unbanked GPIO IRQs functionality<br>
&gt; Patch 2 - allows to register GPIO Platform devices and boot without is=
sues.<br>
&gt;<br>
&gt; Could we move forward with these patches?<br>
&gt;<br>
Can you ACk the patches ?</p>
<p dir=3D"ltr">Regards, <br>
--Prabhakar</p>

--f46d044280cab43b3204eae8ae21--

--===============0928212131==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============0928212131==--
