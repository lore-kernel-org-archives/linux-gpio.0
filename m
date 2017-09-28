From: "Agrawal, Nitesh-kumar" <Nitesh-kumar.Agrawal@amd.com>
Subject: RE: pinctrl/amd: Configure GPIO register using BIOS settings
Date: Thu, 28 Sep 2017 07:46:02 +0000
Message-ID: <DM5PR12MB1417FDCFD60A59EDEAFD336CDC790@DM5PR12MB1417.namprd12.prod.outlook.com>
References: <CY1PR12MB0042D650A9FCDC4B1676FB0EDCFA0@CY1PR12MB0042.namprd12.prod.outlook.com>
 <20170928065816.GA28901@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-sn1nam02on0089.outbound.protection.outlook.com ([104.47.36.89]:26093
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750943AbdI1HqF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 28 Sep 2017 03:46:05 -0400
In-Reply-To: <20170928065816.GA28901@dtor-ws>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "Sen, Pankaj" <Pankaj.Sen@amd.com>, "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

-----Original Message-----
From: Dmitry Torokhov [mailto:dmitry.torokhov@gmail.com]=20
Sent: Thursday, September 28, 2017 12:28 PM
To: Agrawal, Nitesh-kumar <Nitesh-kumar.Agrawal@amd.com>
Cc: linus.walleij@linaro.org; Sen, Pankaj <Pankaj.Sen@amd.com>; S-k, Shyam-=
sundar <Shyam-sundar.S-k@amd.com>; linux-gpio@vger.kernel.org
Subject: Re: pinctrl/amd: Configure GPIO register using BIOS settings

On Fri, Sep 09, 2016 at 03:18:09PM +0000, Agrawal, Nitesh-kumar wrote:
> In the function amd_gpio_irq_set_type, use the settings provided by=20
> the BIOS,when the LevelTrig is Edge and activeLevel is HIGH, to=20
> configure the GPIO registers. Ignore the settings from client.
>=20
> Reviewed-by: Pankaj Sen <Pankaj.Sen@amd.com>
> Signed-off-by: Nitesh Kumar Agrawal <Nitesh-kumar.Agrawal@amd.com>

Just found this patch in the tree. Can you please explain why it is needed =
(the patch description unfortunately tells what the patch does, but not why=
).

I would expect that we either allow reprogramming the trigger as client wis=
hes or would error out and let the upper layers know. Silently "fixing" the=
 settings is wrong course of action in my opinion.

If this was trying to work around Elan touchpad drivers not working on AMD =
platforms it needs to be solved in Elan driver, not here.

[Nitesh]We have reverted the patch in the later version of the patch.

