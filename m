From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 29/50] pinctrl: tegra: Use devm_pinctrl_register() for
 pinctrl registration
Date: Wed, 24 Feb 2016 09:44:08 -0700
Message-ID: <56CDDDD8.8040304@wwwdotorg.org>
References: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
 <1456319775-3216-30-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1456319775-3216-30-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linus.walleij@linaro.org, corbet@lwn.net, lee@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-mediatek@lists.infradead.org, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On 02/24/2016 06:15 AM, Laxman Dewangan wrote:
> Use devm_pinctrl_register() for pin control registration and remove
> need of .remove callback.

Acked-by: Stephen Warren <swarren@nvidia.com>

Any chance you could send a patch to soc-to-kernel-pinctrl-driver.py in 
git://github.com/NVIDIA/tegra-pinmux-scripts.git for this too?
