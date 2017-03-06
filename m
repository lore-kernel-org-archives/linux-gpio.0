From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH] pinctrl: qcom: add get_direction function
Date: Mon, 6 Mar 2017 15:52:08 -0600
Message-ID: <13b19c7f-9440-ab8e-8a2f-d1796a9b3dde@codeaurora.org>
References: <1486768860-18237-1-git-send-email-timur@codeaurora.org>
 <8652c018-4051-5c77-3126-2d41d150518a@codeaurora.org>
 <CACRpkdaoHTZa+XjEBAMtO2dS1jevi5h-QYe90SrZDuJghQSyYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdaoHTZa+XjEBAMtO2dS1jevi5h-QYe90SrZDuJghQSyYw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On 02/22/2017 09:49 AM, Linus Walleij wrote:
> Actually no. The GPIOF* #defines are for the consumer side of GPIO,
> not the driver side. We actually just use 0/1 in drivers.
>
> So I merged this v1 version.

Thanks.

So I have a follow-up question.

On ACPI platforms, the kernel has no control over the muxing (aka function) 
of the various pins.  Firmware configures the TLMM controller for all pins, 
and configures them for whatever functions they're supposed to be.

You can see an example of this in pinctrl-qdf2xxx.c.  As you can see, each 
group consists of 1 pin, and there are 0 functions defined.

Function 0 is plain gpio I/O.  The other functions (1-7, typically) are muxes 
for various devices, like UART TX, etc.

Therefore, on ACPI, the driver should never change the function of any pin. 
If it's set to something other than 0, then it should never touch that pin. 
Don't write to it, don't change the direction, and definitely don't change 
the function.

So would it be acceptable, for example, to change msm_gpio_set() such that if 
the function of that pin is non-zero, just return an error?

After all, if pin #17 is set to UART and not GPIO, then there's no point in 
setting that value to 1 or 0, because it's not muxed for GPIO and therefore, 
that 1/0 is not actually going anywhere.  It won't be written to the pin.

I hope I'm making sense.

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
