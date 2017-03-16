From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: qcom: Don't clear status bit on irq_unmask
Date: Thu, 16 Mar 2017 16:32:07 +0100
Message-ID: <CACRpkdY2BScSz4f6gkxdjSJ4DH7wQOMkawRRz+_XBJMNFy0P2Q@mail.gmail.com>
References: <20170314152326.9424-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20170314152326.9424-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Timur Tabi <timur@codeaurora.org>, stable <stable@vger.kernel.org>, Stephen Boyd <sboyd@codeaurora.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Mar 14, 2017 at 4:23 PM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:

> Clearing the status bit on irq_unmask will discard any pending interrupt
> that did arrive after the irq_ack, i.e. while the IRQ handler function
> was executing.
>
> Fixes: f365be092572 ("pinctrl: Add Qualcomm TLMM driver")
> Cc: stable@vger.kernel.org
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Reported-by: Timur Tabi <timur@codeaurora.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Patch applied for fixes.

Yours,
Linus Walleij
