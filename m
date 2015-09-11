From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v4] pinctrl: mediatek: Implement wake handler and suspend
 resume
Date: Fri, 11 Sep 2015 13:43:52 +0100
Message-ID: <55F2CC88.3030304@arm.com>
References: <1439541486-22203-1-git-send-email-maoguang.meng@mediatek.com>
 <55DB4609.5040904@arm.com>
 <CAGS+omBnoitju07KQ1Y7JHTbce6+DO4WqWHTaKz5D+T157zEJA@mail.gmail.com>
 <1441535972.22230.5.camel@mhfsdcap03> <55EEAA24.6080706@arm.com>
 <55EF11E6.7030307@arm.com>
 <CAM2ehZaDwQtckXcDQQh+XkYKXvVzy-6Tp+kdvRku0w2xVibPtQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:37961 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752227AbbIKMn6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 11 Sep 2015 08:43:58 -0400
In-Reply-To: <CAM2ehZaDwQtckXcDQQh+XkYKXvVzy-6Tp+kdvRku0w2xVibPtQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?B?Q2h1bmctWWloIFdhbmcgKOeOi+W0h+aHvyk=?= <cywang@google.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, maoguang meng <maoguang.meng@mediatek.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>



On 11/09/15 12:22, Chung-Yih Wang (=E7=8E=8B=E5=B4=87=E6=87=BF) wrote:
> Hi Sudeep and Maoguang,
>
>     Please correct me if I am wrong. I think the wake_mask Maoguang
> implemented is the wake-up configuration and it is how he disabled
> other unwanted interrupt sources(e.g. audio jacket insertion) during
> suspend.
>

OK, you are right, I think I now understand the issue. I misread the
code initially thinking the suspend/resume are implemented as
syscore_ops but they are standard device pm ops.

>    With Sudeep's patch which we had similar one before, the system go=
t
> waken up by audio jack insertion which we don't want. Maoguang tried
> to implement wake_mask as the wake-up configuration to keep track of
> effective wakeup sources(i.e. those who makes enable_irq_wake) and
> write the wake-up configuration in mtk_eint_suspend(). What is your
> suggestion to address this issue? Thanks!
>

One option is to convert them to *_noirq callbacks assuming all the
users of this pinctrl irqchip have sanely implemented their
suspend/resume and don't trigger interrupts between dpm_suspend and
suspend_device_irqs. What do you think ?

Regards,
Sudeep

---->8

@@ -1130,8 +1130,8 @@ static int mtk_eint_resume(struct device *device)
  }

  const struct dev_pm_ops mtk_eint_pm_ops =3D {
-       .suspend =3D mtk_eint_suspend,
-       .resume =3D mtk_eint_resume,
+       .suspend_noirq =3D mtk_eint_suspend,
+       .resume_noirq =3D mtk_eint_resume,
  };
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
