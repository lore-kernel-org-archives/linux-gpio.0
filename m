From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: msm: Fix compile error in msm_config_reg()
Date: Fri, 14 Mar 2014 16:39:33 +0100
Message-ID: <CACRpkdbOZmqShCzOyczaTTjJzOU0WhfN1FuOBH-apARJs5AovA@mail.gmail.com>
References: <1394809576-21255-1-git-send-email-gdjakov@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1394809576-21255-1-git-send-email-gdjakov@mm-sol.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Georgi Djakov <gdjakov@mm-sol.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Mar 14, 2014 at 4:06 PM, Georgi Djakov <gdjakov@mm-sol.com> wrote:

> Fix the following compilation error in msm_config_reg():
>
> drivers/pinctrl/pinctrl-msm.c: In function 'msm_config_reg':
> drivers/pinctrl/pinctrl-msm.c:218:4: error: 'reg' undeclared (first use in this
> function)
>
> Error is caused by the mix of these two commits:
> ed118a5fd951bd2def8249ee251842c4f81fe4bd
> 051a58b4622f0e1b732acb750097c64bc00ddb93
>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> Signed-off-by: Georgi Djakov <gdjakov@mm-sol.com>

Thanks, but I already sent an identical fix earlier today!

Yours,
Linus Walleij
