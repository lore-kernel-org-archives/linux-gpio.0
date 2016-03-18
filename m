From: Scott Wood <scott.wood@nxp.com>
Subject: Re: [PATCH] gpio/ls1043a: Correct ls1043a gpio nodes compatible in
 dts file
Date: Fri, 18 Mar 2016 18:49:00 +0000
Message-ID: <DB5PR0401MB19283736845DCFD5F4186729918C0@DB5PR0401MB1928.eurprd04.prod.outlook.com>
References: <1457600240-47141-1-git-send-email-Gang.Liu@nxp.com>
 <1457600240-47141-2-git-send-email-Gang.Liu@nxp.com>
 <DB5PR0401MB192833673541757889C889C1918A0@DB5PR0401MB1928.eurprd04.prod.outlook.com>
 <DB4PR04MB26636780AB3453AE0D3E218828B0@DB4PR04MB266.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
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
To: Gang Liu <gang.liu@nxp.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "khilman@linaro.org" <khilman@linaro.org>
Cc: Leo Li <leo.li@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>
List-Id: linux-gpio@vger.kernel.org

On 03/17/2016 01:57 AM, Gang Liu wrote:
> On 3/17/2016 2:47 AM, Scott Wood wrote:
>> On 03/10/2016 03:06 AM, Liu Gang wrote:
>>> The ls1043a belongs to the Freescale QorIQ platform, and QorIQ
>>> platform's gpio nodes should use compatible "fsl,qoriq-gpio".
>> Why?  I don't see any version register anything else in this block that
>> could be used to identify potential differences from chip to chip.  At
>> the least, both compatibles should be present.
>>
>> Where is the binding for this?
>>
>> -Scott
>>
>>
> Hi, Scott,
> Currently all QorIQ platform's GPIO IP blocks are same, they are all no
> version register,
> and have same registers, offset address and other features, so the code
> can cover all of
> them.

So?  We have no idea what the hardware people will do in the future.

> There is just one exceptional ls2080, it has the little-endian GPIO
> registers, and we added
> a "little-endian" property in the GPIO nodes.
> 
> Add in addition, we have deeply discussed about the GPIO compatible name
> before, you
> suggested using "fsl,qoriq-gpio" for all the QorIQ platforms. Please
> find some excerpt
> from former mail context.

It's in established use so I won't suggest that we get rid of it.  But
ideally the chip-specific compatible should be in the device tree (not
the driver until/unless necessary) as well, so it seemed odd to get rid
of it.

If we were starting from scratch, then instead of "fsl,qoriq-gpio" it
should have been a chip-based compatible for some arbitrary chip that
contains this exact logic (in addition to the chip-specific compatible
for the actual chip).  Neither case requires adding every chip name to
the driver.

-Scott
