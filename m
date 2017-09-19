From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 0/2] [v5] pinctrl: qcom: add support for sparse GPIOs
Date: Tue, 19 Sep 2017 00:04:22 -0700
Message-ID: <20170919070422.GI3349@codeaurora.org>
References: <1504798409-32041-1-git-send-email-timur@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1504798409-32041-1-git-send-email-timur@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Timur Tabi <timur@codeaurora.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, david.brown@linaro.org, andy.gross@linaro.org, anjiandi@codeaurora.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

On 09/07, Timur Tabi wrote:
> First patch allows for for pinctrl-msm to understand GPIO groups with
> no pins.  Such pins are "hidden" and can't be exported or accessed.
> 
> Second patch updates the QDF2xxx driver to take advantage of all that.
> 
> v5:
>  Since gpiochip_add_data no longer requests GPIOs before scanning for
>  the direction (that patch was reverted), pinctrl-msm.c now specifically
>  checks for special case.

Can we add a new gpiochip op that checks for "availability". I
read the other thread where the change was reverted (please add a
pointer next time), and as I understand it the gpio request
method can also change the muxing to a gpio instead of something
else. Perhaps we can add another hook for our purposes here that
tells gpiolib that the gpio is not usable and to skip it. The
semantics would be clear, it's just about probing availability of
this pin as a gpio and doesn't mux any pins.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
