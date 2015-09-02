From: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Subject: Re: Question about patch "pinctrl: cherryview: Do not mask all
 interrupts on probe"
Date: Wed, 2 Sep 2015 10:06:55 -0400
Message-ID: <CA+A7VXWD6Fg2zvVsP5H=j7zfOiEq4XTNGR=eVeGYTkC75bcfuQ@mail.gmail.com>
References: <CA+A7VXVOpLCvk3YLWq9=ESKGRUg3E+rBOV65eEEkw-TOTaCavQ@mail.gmail.com>
 <20150902073633.GD1609@lahna.fi.intel.com> <36DF59CE26D8EE47B0655C516E9CE6401CB03CF9@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yk0-f177.google.com ([209.85.160.177]:36811 "EHLO
	mail-yk0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751451AbbIBOHg convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Sep 2015 10:07:36 -0400
Received: by ykcf206 with SMTP id f206so10433812ykc.3
        for <linux-gpio@vger.kernel.org>; Wed, 02 Sep 2015 07:07:36 -0700 (PDT)
In-Reply-To: <36DF59CE26D8EE47B0655C516E9CE6401CB03CF9@SHSMSX101.ccr.corp.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Chen, Yu C" <yu.c.chen@intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "Zheng, Lv" <lv.zheng@intel.com>

On 2 September 2015 at 04:06, Chen, Yu C <yu.c.chen@intel.com> wrote:
>
>> -----Original Message-----
>> From: Mika Westerberg [mailto:mika.westerberg@linux.intel.com]
>> Sent: Wednesday, September 02, 2015 3:37 PM
>> To: Jo=C3=A3o Paulo Rechi Vita
>> Cc: linux-gpio@vger.kernel.org; Chen, Yu C
>> Subject: Re: Question about patch "pinctrl: cherryview: Do not mask =
all
>> interrupts on probe"
>>
>> On Tue, Sep 01, 2015 at 04:09:12PM -0400, Jo=C3=A3o Paulo Rechi Vita=
 wrote:
>> >
>> > I'm working on a ASUS E202SA laptop, in which the brightness keys
>> > depend on this patch to work. Are any plans to have it integrated,=
 in
>> > the original form or in any other?
>>
>> Adding Yu to the loop.
>>
>> Yu was investigating alternative ways to fix this. Did you come to s=
ome
>> conclusion?
>
> Once I wrote a quirk patch to re-enable gpio irq in Embedded Controll=
er driver, and since
> ec driver is loaded before pinctrl driver , I need to modify the patc=
h to add a delay 'request_irq'
> in ec driver, maybe a workqueue mechanism. Then I switched to some ot=
her bugs..
> Yes, I'll continue this work recently, please stay tuned.

That's good news, thank you very much for the info! I'll keep checking
for updates about this on linux-gpio, but I can also do some testing
if needed, just let me know.

Cheers,

--
Jo=C3=A3o Paulo Rechi Vita
http://about.me/jprvita
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
