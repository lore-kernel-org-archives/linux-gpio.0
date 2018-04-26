From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH] gpioib: do not free unrequested descriptors
Date: Thu, 26 Apr 2018 11:46:01 -0500
Message-ID: <66e9f476-4105-710a-806d-b289ba04b058@codeaurora.org>
References: <1522348152-15024-1-git-send-email-timur@codeaurora.org>
 <CACRpkdb=PqqJLC72DWE1ynu6f5cwB99zG=ECW3dpX0t3cF9Wbg@mail.gmail.com>
 <CAMRc=Mey7adAwUuYtcDXmvL3gBNzxQ6kg+fQ1WYRtmgMSZ0UMg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <CAMRc=Mey7adAwUuYtcDXmvL3gBNzxQ6kg+fQ1WYRtmgMSZ0UMg@mail.gmail.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, stable <stable@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 04/26/2018 11:44 AM, Bartosz Golaszewski wrote:
>>
>> Bartosz, can you have a quick look at this? Did you run into the
>> problem at any point?
>>
> I have never seen this issue, but the patch looks correct to me.

The issue can only occur if you have sparse GPIOs, and you tried to 
request one that doesn't exist, which probably never happened prior to 4.17.

Thanks for the review.

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
