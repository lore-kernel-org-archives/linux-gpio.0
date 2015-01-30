From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] pinctrl: qcom: delete pin_config_get/set pinconf operations
Date: Fri, 30 Jan 2015 14:37:00 +0100
Message-ID: <CACRpkdYwNvEyjtmKK9Ln5Vrjxe-LavY5ig1ooBvxwW=vbHhpMQ@mail.gmail.com>
References: <1422613644-13060-1-git-send-email-svarbanov@mm-sol.com>
	<1422613644-13060-2-git-send-email-svarbanov@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1422613644-13060-2-git-send-email-svarbanov@mm-sol.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Stephen Boyd <sboyd@codeaurora.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Jan 30, 2015 at 11:27 AM, Stanimir Varbanov
<svarbanov@mm-sol.com> wrote:

> The .pin_config_get/set operation are not supported in qcom pinctrl
> driver. As the pinconf core is smart enough it doesn't complain
> about that.
>
> Signed-off-by: Stanimir Varbanov <svarbanov@mm-sol.com>

Patch applied as it is obviously correct.

Yours,
Linus Walleij
