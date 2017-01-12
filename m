From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] pinctrl: Initialize pinctrl_dev.node
Date: Thu, 12 Jan 2017 20:13:39 +0000
Message-ID: <492f05b7-5b41-16ab-5d8a-83801d617e9a@nvidia.com>
References: <20170112160334.22943-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170112160334.22943-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org



On 12/01/17 16:03, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The struct pinctrl_dev's node field is not properly set up, which means
> the .prev and .next fields will be NULL. That's not something that the
> linked list code can deal with, so extra care must be taken when using
> these fields. An example of this is introduced in commit 3429fb3cda34
> ("pinctrl: Fix panic when pinctrl devices with hogs are unregistered")
> where list_del() is made conditional on the pinctrl device being part
> of the pinctrl device list. This is to ensure that list_del() won't
> crash upon encountering a NULL pointer in .prev and/or .next.
> 
> After initializing the list head there's no need to jump through these
> extra hoops and list_del() will work unconditionally. This is because
> the initialized list head points to itself and therefore the .prev and
> .next fields can be properly dereferenced.
> 
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Thanks for catching this.

Acked-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
