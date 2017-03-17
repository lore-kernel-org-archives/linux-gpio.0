From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] pinctrl: qcom: ipq4019: add missing pingroups for pins >
 70
Date: Thu, 16 Mar 2017 23:02:37 -0700
Message-ID: <20170317060237.GC54108@Bjorns-MacBook-Pro-2.local>
References: <20170316203607.12714-1-chunkeey@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170316203607.12714-1-chunkeey@googlemail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Christian Lamparter <chunkeey@googlemail.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, David Brown <david.brown@linaro.org>, Andy Gross <andy.gross@linaro.org>
List-Id: linux-gpio@vger.kernel.org

On Thu 16 Mar 13:36 PDT 2017, Christian Lamparter wrote:

> This patch adds the missing PINGROUP for GPIO70-99.
> This fixes a crash that happens in pinctrl-msm, if any
> of the GPIO70-99 are accessed.
> 
> Fixes: 5303f7827fcd41d ("pinctrl: qcom: ipq4019: set ngpios to correct value")
> Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
