From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: qcom: Add support for MDM9615 TLMM
Date: Mon, 27 Jun 2016 22:03:15 -0700
Message-ID: <20160628050315.GC1190@tuxbot>
References: <1466158535-17962-1-git-send-email-narmstrong@baylibre.com>
 <1466158535-17962-2-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1466158535-17962-2-git-send-email-narmstrong@baylibre.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linus.walleij@linaro.org, andy.gross@linaro.org, sricharan@codeaurora.org, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Fri 17 Jun 03:15 PDT 2016, Neil Armstrong wrote:

> In order to support the Qualcomm MDM9615 SoC, add support for the TLMM
> using the Qualcomm pinctrl generic driver.
> 
> Note: the pinctrl is partial, need Documentation to complete all the groups.
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Unfortunately I don't have docs for this platform; but what you have
here looks reasonable.

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
