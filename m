From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH] gpioib: do not free unrequested descriptors
Date: Sun, 15 Apr 2018 22:20:56 -0500
Message-ID: <a265df55-e425-b124-fe67-ea979a908562@codeaurora.org>
References: <1522348152-15024-1-git-send-email-timur@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1522348152-15024-1-git-send-email-timur@codeaurora.org>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 3/29/18 1:29 PM, Timur Tabi wrote:
> If the main loop in linehandle_create() encounters an error, it
> unwinds completely by freeing all previously requested GPIO
> descriptors.  However, if the error occurs in the beginning of
> the loop before that GPIO is requested, then the exit code
> attempts to free a null descriptor.  If extrachecks is enabled,
> gpiod_free() triggers a WARN_ON.
> 
> Instead, keep a separate count of legitimate GPIOs so that only
> those are freed.

Linus, this is an important fix that's needed for sparse GPIO support. 
Any chance that it can make 4.17?

Also, my other patchset for qdf2xxx support has been reviewed by Bjorn 
and Stephen.  Can you add that to 4.17 also?

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
