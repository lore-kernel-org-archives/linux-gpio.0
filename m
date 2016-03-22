From: Scott Wood <scott.wood@nxp.com>
Subject: Re: [PATCH] gpio/ls1043a: Correct ls1043a gpio nodes compatible in
 dts file
Date: Tue, 22 Mar 2016 16:00:19 +0000
Message-ID: <DB5PR0401MB19284B4AAA63BD31A605AC7691800@DB5PR0401MB1928.eurprd04.prod.outlook.com>
References: <1457600240-47141-1-git-send-email-Gang.Liu@nxp.com>
 <1457600240-47141-2-git-send-email-Gang.Liu@nxp.com>
 <DB5PR0401MB192833673541757889C889C1918A0@DB5PR0401MB1928.eurprd04.prod.outlook.com>
 <DB4PR04MB26636780AB3453AE0D3E218828B0@DB4PR04MB266.eurprd04.prod.outlook.com>
 <DB5PR0401MB19283736845DCFD5F4186729918C0@DB5PR0401MB1928.eurprd04.prod.outlook.com>
 <DB4PR04MB2660ED371AE3599B6EC8F8E82800@DB4PR04MB266.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-db3on0074.outbound.protection.outlook.com ([157.55.234.74]:13640
	"EHLO emea01-db3-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751245AbcCVQAX convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Mar 2016 12:00:23 -0400
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gang Liu <gang.liu@nxp.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "khilman@linaro.org" <khilman@linaro.org>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, Yang-Leo Li <leoyang.li@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>

On 03/22/2016 09:03 AM, Gang Liu wrote:
> Hi, Scott,
> 
> I think you mean that GPIO node needs two compatibles, one for general GPIO IP block ("fsl,qoriq-gpio")
> and another for chip-specific ("fsl,ls1043a-gpio").
> The driver can just include general GPIO IP block compatible, and if there is a errata for ls1043 GPIO, the
> chip-specific compatible can be used to fix the errata, right?

Yes.

> If it's right, do you think the "fsl,ls1043a-gpio" and "fsl,qoriq-gpio" are ok for our Layerscape platforms?

Yes.

-Scott

