From: Chris Gorman <chrisjohgorman@gmail.com>
Subject: Re: [PATCH] pinctrl: cherryview: fix issues caused by dynamic gpio
 irqs mapping
Date: Fri, 6 Oct 2017 09:02:43 -0400
Message-ID: <CAHVeOW9xgYZ+YiLge8dErShJuTrWEWfrmcbuykULSV4WX=UHeQ@mail.gmail.com>
References: <20171003170049.24480-1-grygorii.strashko@ti.com>
 <20171004064249.GP2761@lahna.fi.intel.com> <20171006081949.GX2761@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171006081949.GX2761@lahna.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
List-Id: linux-gpio@vger.kernel.org

Hello all,

Apologies if you are receiving this acknowledgement a second time.  I
have tested this patch on an Intel_Strago chromebook (Acer cb3-532)
and it works to enable the keyboard.  I tested it on 4.14.0-rc3.  Let
me know if you want me to test the patch on the stable branch.

Tested-by: Chris Gorman <chrisjohgorman@gmail.com>

On Fri, Oct 6, 2017 at 4:19 AM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Wed, Oct 04, 2017 at 09:42:49AM +0300, Mika Westerberg wrote:
>> On Tue, Oct 03, 2017 at 12:00:49PM -0500, Grygorii Strashko wrote:
>> > New GPIO IRQs are allocated and mapped dynamically by default when
>> > GPIO IRQ infrastructure is used by cherryview-pinctrl driver.
>> > This causes issues on some Intel platforms [1][2] with broken BIOS which
>> > hardcodes Linux IRQ numbers in their ACPI tables.
>> >
>> > On such platforms cherryview-pinctrl driver should allocate and map all
>> > GPIO IRQs at probe time.
>> > Side effect - "Cannot allocate irq_descs @ IRQ%d, assuming pre-allocated\n"
>> > can be seen at boot log.
>> >
>> > NOTE. It still may fail if boot sequence will changed and some interrupt
>> > controller will be probed before cherryview-pinctrl which will shift Linux IRQ
>> > numbering (expected with CONFIG_SPARCE_IRQ enabled).
>> >
>> > [1] https://bugzilla.kernel.org/show_bug.cgi?id=194945
>> > [2] https://lkml.org/lkml/2017/9/28/153
>> > Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
>> > Cc: Chris Gorman <chrisjohgorman@gmail.com>
>> > Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
>> > Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>> > Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
>> > Reported-by: Chris Gorman <chrisjohgorman@gmail.com>
>> > Reported-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>>
>> Looks reasonable to me. Thanks for taking care of this!
>>
>> Chris, can you try if this fixes the issue and provide your Tested-by?
>
> Linus,
>
> Chris gave his tested-by in another thread:
>
>   https://patchwork.kernel.org/patch/9985087/
>
> Chris, please let me know if that was not your intention.
>
> I'm fine with the patch as well,
>
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>
> I guess this requires stable tag because if I understand comments in
> that bug right, it affects the whole v4.13.
