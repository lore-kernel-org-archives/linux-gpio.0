From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 2/2] pinctrl: qcom: qdf2xxx: add support for new ACPI HID
 QCOM8002
Date: Sat, 07 Apr 2018 05:33:00 -0700
Message-ID: <152310438008.180276.15989327938738839272@swboyd.mtv.corp.google.com>
References: <1521848700-22214-1-git-send-email-timur@codeaurora.org>
 <1521848700-22214-2-git-send-email-timur@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1521848700-22214-2-git-send-email-timur@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: timur@codeaurora.org
List-Id: linux-gpio@vger.kernel.org

Quoting Timur Tabi (2018-03-23 16:45:00)
> Newer versions of the firmware for the Qualcomm Datacenter Technologies
> QDF2400 restricts access to a subset of the GPIOs on the TLMM.  To
> prevent older kernels from accidentally accessing the restricted GPIOs,
> we change the ACPI HID for the TLMM block from QCOM8001 to QCOM8002,
> and introduce a new property "gpios".  This property is an array of
> specific GPIOs that are accessible.  When an older kernel boots on
> newer (restricted) firmware, it will fail to probe.
> 
> To implement the sparse GPIO map, we register all of the GPIOs, but
> fill in the data only for available GPIOs.  This ensures that the driver
> cannot accidentally access an unavailable GPIO.
> 
> The pinctrl-msm driver also scans the "gpios" property to determine
> which pins are available, and ensure that only those can be registered.
> 
> Support for QCOM8001 is removed as there is no longer any firmware that
> implements it.
> 
> Signed-off-by: Timur Tabi <timur@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
