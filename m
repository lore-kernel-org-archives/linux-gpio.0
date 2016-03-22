From: Gang Liu <gang.liu@nxp.com>
Subject: RE: [PATCH] gpio/ls1043a: Correct ls1043a gpio nodes compatible in
 dts file
Date: Tue, 22 Mar 2016 14:03:22 +0000
Message-ID: <DB4PR04MB2660ED371AE3599B6EC8F8E82800@DB4PR04MB266.eurprd04.prod.outlook.com>
References: <1457600240-47141-1-git-send-email-Gang.Liu@nxp.com>
 <1457600240-47141-2-git-send-email-Gang.Liu@nxp.com>
 <DB5PR0401MB192833673541757889C889C1918A0@DB5PR0401MB1928.eurprd04.prod.outlook.com>
 <DB4PR04MB26636780AB3453AE0D3E218828B0@DB4PR04MB266.eurprd04.prod.outlook.com>
 <DB5PR0401MB19283736845DCFD5F4186729918C0@DB5PR0401MB1928.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <DB5PR0401MB19283736845DCFD5F4186729918C0@DB5PR0401MB1928.eurprd04.prod.outlook.com>
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
To: Scott Wood <scott.wood@nxp.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "khilman@linaro.org" <khilman@linaro.org>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>, Yang-Leo Li <leoyang.li@nxp.com>
List-Id: linux-gpio@vger.kernel.org

Hi, Scott,

I think you mean that GPIO node needs two compatibles, one for general GPIO IP block ("fsl,qoriq-gpio")
and another for chip-specific ("fsl,ls1043a-gpio").
The driver can just include general GPIO IP block compatible, and if there is a errata for ls1043 GPIO, the
chip-specific compatible can be used to fix the errata, right?

If it's right, do you think the "fsl,ls1043a-gpio" and "fsl,qoriq-gpio" are ok for our Layerscape platforms?
So maybe I need to create more patches for ls1021, ls2085 platform supported in opensource.

Best Regards,
Liu Gang

-----Original Message-----
From: Scott Wood 
Sent: Saturday, March 19, 2016 2:49 AM
To: Gang Liu <gang.liu@nxp.com>; linus.walleij@linaro.org; linux-gpio@vger.kernel.org; linux-arm-kernel@lists.infradead.org; khilman@linaro.org
Cc: robh+dt@kernel.org; Leo Li <leo.li@nxp.com>; Mingkai Hu <mingkai.hu@nxp.com>
Subject: Re: [PATCH] gpio/ls1043a: Correct ls1043a gpio nodes compatible in dts file

> Hi, Scott,
> Currently all QorIQ platform's GPIO IP blocks are same, they are all 
> no version register, and have same registers, offset address and other 
> features, so the code can cover all of them.

So?  We have no idea what the hardware people will do in the future.

> There is just one exceptional ls2080, it has the little-endian GPIO 
> registers, and we added a "little-endian" property in the GPIO nodes.
> 
> Add in addition, we have deeply discussed about the GPIO compatible 
> name before, you suggested using "fsl,qoriq-gpio" for all the QorIQ 
> platforms. Please find some excerpt from former mail context.

It's in established use so I won't suggest that we get rid of it.  But ideally the chip-specific compatible should be in the device tree (not the driver until/unless necessary) as well, so it seemed odd to get rid of it.

If we were starting from scratch, then instead of "fsl,qoriq-gpio" it should have been a chip-based compatible for some arbitrary chip that contains this exact logic (in addition to the chip-specific compatible for the actual chip).  Neither case requires adding every chip name to the driver.

-Scott
