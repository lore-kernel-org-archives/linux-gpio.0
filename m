From: "weiyongjun (A)" <weiyongjun1@huawei.com>
Subject: RE: [PATCH -next] pinctrl: artpec6: Fix return value check in
 artpec6_pmx_probe()
Date: Tue, 25 Apr 2017 09:18:05 +0000
Message-ID: <6AADFAC011213A4C87B956458587ADB47BDA03@SZXEMI508-MBX.china.huawei.com>
References: <20170425032945.22157-1-weiyj.lk@gmail.com>
 <20170425083120.GI18509@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from szxga01-in.huawei.com ([45.249.212.187]:5798 "EHLO
        dggrg01-dlp.huawei.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1428694AbdDYJeH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Apr 2017 05:34:07 -0400
In-Reply-To: <20170425083120.GI18509@axis.com>
Content-Language: zh-CN
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jesper Nilsson <jesper.nilsson@axis.com>, Wei Yongjun <weiyj.lk@gmail.com>
Cc: Jesper Nilsson <jespern@axis.com>, Lars Persson <larper@axis.com>, Niklas Cassel <niklass@axis.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-arm-kernel@axis.com" <linux-arm-kernel@axis.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>



> -----Original Message-----
> From: Jesper Nilsson [mailto:jesper.nilsson@axis.com]
> Sent: Tuesday, April 25, 2017 4:31 PM
> To: Wei Yongjun <weiyj.lk@gmail.com>
> Cc: Jesper Nilsson <jespern@axis.com>; Lars Persson <larper@axis.com>;
> Niklas Cassel <niklass@axis.com>; Linus Walleij <linus.walleij@linaro.org>;
> weiyongjun (A) <weiyongjun1@huawei.com>; linux-arm-kernel@axis.com;
> linux-gpio@vger.kernel.org
> Subject: Re: [PATCH -next] pinctrl: artpec6: Fix return value check in
> artpec6_pmx_probe()
> 
> On Tue, Apr 25, 2017 at 03:29:45AM +0000, Wei Yongjun wrote:
> > From: Wei Yongjun <weiyongjun1@huawei.com>
> >
> > In case of error, the function pinctrl_register() returns
> > NULL not ERR_PTR(). The IS_ERR() test in the return value
> > check should be replaced with NULL test.
> 
> Uh, the comment above reads as the exact opposite
> of what the patch does. Your point is valid though,
> but the comment needs rephrasing.
> 

Oh, sorry, I will send the v2 patch with comment fixed soon.
Thanks.

Wei Yongjun
