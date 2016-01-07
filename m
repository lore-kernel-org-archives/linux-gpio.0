From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 1/3] gpio: brcmstb: have driver register during subsys_initcall()
Date: Thu, 07 Jan 2016 10:12:41 -0800
Message-ID: <568EAA99.1020603@gmail.com>
References: <1452106523-11556-1-git-send-email-f.fainelli@gmail.com> <1452106523-11556-2-git-send-email-f.fainelli@gmail.com> <CADtm3G7_pGdgM8EJgRzRf8j1JAJKivxzd85ie5haWP8ivZvwSg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <CADtm3G7_pGdgM8EJgRzRf8j1JAJKivxzd85ie5haWP8ivZvwSg@mail.gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Gregory Fong <gregory.0xf0@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-gpio@vger.kernel.org, MIPS <linux-mips@linux-mips.org>, jaedon.shin@gmail.com, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Jim Quinlan <jim2101024@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On 06/01/16 22:05, Gregory Fong wrote:
> Hello Florian and Jim,
> 
> On Wed, Jan 6, 2016 at 10:55 AM, Florian Fainelli <f.fainelli@gmail.com> wrote:
>> From: Jim Quinlan <jim2101024@gmail.com>
>>
>> Because regulators are started with subsys_initcall(), and gpio references may
>> be contained in the regulators, it makes sense to start the brcmstb-gpio's with
>> a subsys_initcall(). The order within the drivers/Makefile ensures that the
>> gpio initialization happens prior to the regulator's initialization.
>>
>> We need to unroll module_platform_driver() now to allow this and have custom
>> exit and init module functions to control the initialization level.
> 
> If gpio pins are needed for a regulator to come up, wouldn't it be
> better to handle this using deferred probe instead of initcall-based
> initialization?  Deferred probe has its problems, but I was under the
> impression that it's the encouraged way to resolve these sort of
> initialization order issues.

To give you some more context associated with this change, we now have
some boards which have GPIO-connected regulators to turn on/off PCIe
endpoint devices. In the downstream kernel, and with lack of a better
solution for now, we ended-up having the PCIE Root Complex driver to
claim these regulator, and flip them on shortly before attempting a bus
scan.

If we used deferred probing, I am assuming the sequence of events could
go like this:

- PCIe driver gets initialized, looks for regulators, cannot get a
handle on them, gets EPROBE_DEFER (arch_initcall right now)
- regulator subsystem gets initialized, does not have a valid GPIO
provider driver yet, returns EPROBE_DEFER (subsys_initcall)
- GPIO provider (gpio-brcmstb) finally gets probed and registered,
regulator get registered and available, PCIe RC driver can now use them
and power on the PCIE end point (module_initcall)

I suppose this might be working actually, let me go back to the white
board and look at this with Jim.
-- 
Florian
