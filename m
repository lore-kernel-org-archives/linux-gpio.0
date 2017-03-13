From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH fixes v4] pinctrl: Do not check previous and current state
Date: Mon, 13 Mar 2017 11:59:47 -0700
Message-ID: <d9a20f6c-96e5-1e12-447d-fbea5014fa57@gmail.com>
References: <20170307185236.31805-1-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:35998 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751829AbdCMS7v (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Mar 2017 14:59:51 -0400
In-Reply-To: <20170307185236.31805-1-f.fainelli@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: andy.shevchenko@gmail.com, swarren@nvidia.com, alcooperx@gmail.com, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

On 03/07/2017 10:52 AM, Florian Fainelli wrote:
> In case a platform only defaults a "default" set of pins, but not a
> "sleep" set of pins, and this particular platform suspends and resumes
> in a way that the pin states are not preserved by the hardware, when we
> resume, we would call pinctrl_single_resume() -> pinctrl_force_default()
> -> pinctrl_select_state() and the first thing we do is check that the
> pins state is the same as before, and do nothing.
> 
> In order to fix this, just remove the p->state == state check from
> pinctrl_select_state() since it would not allow callers of this function
> to get the pins to be brought into the expected state.
> 
> Fixes: 6e5e959dde0d ("pinctrl: API changes to support multiple states per device")
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---

Linus am I hitting some of your spam folder, or you are really having
way too much fun with Gemini ;) ?

> Changes in v4:
> 
> - just remove the p->state == state check because it cannot allow pinctrl_select_state
>   to work for callers that expect it to do the actual state change
> 
> Changes in v3:
> 
> - move the state check to pinctrl_select_state
> 
> Changes in v2:
> 
> - rename __pinctrl_select_state to pinctrl_commit_state
> 
>  drivers/pinctrl/core.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
> index d69046537b75..33cef0a65c9c 100644
> --- a/drivers/pinctrl/core.c
> +++ b/drivers/pinctrl/core.c
> @@ -1203,9 +1203,6 @@ int pinctrl_select_state(struct pinctrl *p, struct pinctrl_state *state)
>  	struct pinctrl_state *old_state = p->state;
>  	int ret;
>  
> -	if (p->state == state)
> -		return 0;
> -
>  	if (p->state) {
>  		/*
>  		 * For each pinmux setting in the old state, forget SW's record
> 


-- 
Florian
