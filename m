From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH 0/2] [v5] pinctrl: qcom: add support for sparse GPIOs
Date: Wed, 13 Sep 2017 12:09:40 -0500
Message-ID: <0dbd161e-5437-7acb-9bc9-4a7b5869a4d7@codeaurora.org>
References: <1504798409-32041-1-git-send-email-timur@codeaurora.org>
 <CACRpkdb563nCp9iptfzZOUPX6B0-qU+iWzurn-JL4PQCPHqStw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CACRpkdb563nCp9iptfzZOUPX6B0-qU+iWzurn-JL4PQCPHqStw@mail.gmail.com>
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, anjiandi@codeaurora.org, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 09/08/2017 07:50 AM, Linus Walleij wrote:
>>   Since gpiochip_add_data no longer requests GPIOs before scanning for
>>   the direction (that patch was reverted), pinctrl-msm.c now specifically
>>   checks for special case.
> Waiting for Bjorn's review on these.

Bjorn,

Do you think you will have a chance to review these patches in time for 
4.14?

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
