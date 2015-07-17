From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 8/8] pinctrl: qcom: ssbi: Family A gpio & mpp drivers
Date: Fri, 17 Jul 2015 14:35:45 +0200
Message-ID: <CACRpkdY0Nx_Rm7jtL1hpJ-_zB4iXRmeA=-_cUV_zQQU5En2GDg@mail.gmail.com>
References: <1436942435-25611-1-git-send-email-bjorn.andersson@sonymobile.com>
	<1434610052-602-9-git-send-email-bjorn.andersson@sonymobile.com>
	<1436942435-25611-3-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1436942435-25611-3-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>, Lee Jones <lee.jones@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jul 15, 2015 at 8:40 AM, Bjorn Andersson
<bjorn.andersson@sonymobile.com> wrote:

> This introduces pinctrl drivers for gpio and mpp blocks found in family A
> PMICs.
>
> Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> ---
>
> Changes since v1:
> - Update platform_driver name
> - Use of_device_get_match_data()

This v2 version applied for v4.3.

Yours,
Linus Walleij
