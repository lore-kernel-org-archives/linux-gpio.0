From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 00/50] pinctrl: Add and use devm_ apis for pinctrl_{register,
 unregister}
Date: Wed, 24 Feb 2016 22:44:52 +0530
Message-ID: <56CDE50C.4050504@nvidia.com>
References: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com> <771728522.222286.b52ca77e-fe5e-4536-8e14-525e9a846cdc.open-xchange@email.1und1.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <771728522.222286.b52ca77e-fe5e-4536-8e14-525e9a846cdc.open-xchange@email.1und1.de>
Sender: linux-doc-owner@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>, linus.walleij@linaro.org, lee@kernel.org, corbet@lwn.net
Cc: linux-doc@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>
List-Id: linux-gpio@vger.kernel.org


On Wednesday 24 February 2016 10:52 PM, Stefan Wahren wrote:
> Hi Laxman,
>
>> Laxman Dewangan <ldewangan@nvidia.com> hat am 24. Februar 2016 um 14:15
>> geschrieben:
>>
>>
>> Add resource manageemnt APIs fro pinctrl_register() and pinctrl_unregister()
>> and use these new APIs on hw driver to reduce the error path code and
>> remove callback for driver.
>>
> just for interest: why didn't you patch freescale/pinctrl-mxs.c?
>


The remove callback is implemented as:

int mxs_pinctrl_remove(struct platform_device *pdev)
{
         struct mxs_pinctrl_data *d = platform_get_drvdata(pdev);

         pinctrl_unregister(d->pctl);
         iounmap(d->base);

         return 0;
}


So if I use devm_pinctrl_register() then the sequence will be different like
     iounmap()
     pinctrl_unregister()

And I did not want to change the sequence as dont know the side effect 
until I test it on actual platform which is not there with me.

