From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: Subject: [PATCH 00/22] gpio: xilinx: update driver to match
 official xilinx version
Date: Mon, 23 Jul 2018 13:48:59 +0200
Message-ID: <725e0413-7293-5535-73b9-78c28e56e321@xilinx.com>
References: <5D23E7CAADD3BE4A97642792FFC691C561C7A3D7@MBX215.d.ethz.ch>
 <CACRpkdan_Fc8E2o69_48OZU-N_4HUBh2uY77Se3qTVvRSny3bA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdan_Fc8E2o69_48OZU-N_4HUBh2uY77Se3qTVvRSny3bA@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>, ahedges@student.ethz.ch, Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Michal Simek <michal.simek@xilinx.com>
List-Id: linux-gpio@vger.kernel.org

On 22.7.2018 21:24, Linus Walleij wrote:
> On Sat, Jul 21, 2018 at 4:14 PM Hedges Alexander
> <ahedges@student.ethz.ch> wrote:
> 
> An overarching question:
> 
> the whole patch set contains things like this:
> 
>> +#ifdef CONFIG_OF
> (...)
>> +#else
> (...)
>> +#endif
> 
> But arch/arm/mach-zynq and the Aarch64 counterpart are
> OF-only.
> 
> I.e. these adaptions must have been made for some Xilinx
> platform support codebase that is not upstream, and which does
> not use device tree.

I was used 10+ years ago when CONFIG_OF doesn't exist.
All these platforms have been moved to OF long time ago too.
I don't think there is any reason to keep any support for !OF case.

Thanks,
Michal
