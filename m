From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH] pinctrl: msm: Use dynamic GPIO numbering
Date: Wed, 7 Feb 2018 08:52:03 -0600
Message-ID: <f26a61ac-c8ba-e37a-4266-4e594f5b0bce@codeaurora.org>
References: <20180129005948.7714-1-bjorn.andersson@linaro.org>
 <CACRpkdb0OWQzeJZ7K1bXrdNPwu0GhygW1p04Xoyf9WjTg7+=BQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CACRpkdb0OWQzeJZ7K1bXrdNPwu0GhygW1p04Xoyf9WjTg7+=BQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 2/7/18 7:52 AM, Linus Walleij wrote:
> Otherwise we need something that conserves base 0 for singular
> TLMM drivers and make it -1 for newer platforms with several
> instances.

     static int base = 0;

     chip->base = base;
     base = -1;

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
