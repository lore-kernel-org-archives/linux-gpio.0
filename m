From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH fixes v2] pinctrl: Really force states during
 suspend/resume
Date: Wed, 1 Mar 2017 10:29:00 -0800
Message-ID: <9f02caa1-638a-cb72-c87f-69e4282ae67d@gmail.com>
References: <20170227230634.10688-1-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170227230634.10688-1-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: swarren@nvidia.com, andy.shevchenko@gmail.com, alcooperx@gmail.com, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 02/27/2017 03:06 PM, Florian Fainelli wrote:
> In case a platform only defaults a "default" set of pins, but not a
> "sleep" set of pins, and this particular platform suspends and resumes
> in a way that the pin states are not preserved by the hardware, when we
> resume, we would call pinctrl_single_resume() -> pinctrl_force_default()
> -> pinctrl_select_state() and the first thing we do is check that the
> pins state is the same as before, and do nothing.
> 
> In order to fix this, decouple pinctrl_select_state and make it become
> pinctrl_commit_state(), taking an additional ignore_state_check boolean
> which allows us to bypass the state check during suspend/resume, since
> we really want to re-apply the previous pin states in these case.
> 
> Fixes: 6e5e959dde0d ("pinctrl: API changes to support multiple states per device")
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Linus, I have a better version of this coming where the p->state ==
state check is just moved into pinctrl_select_state() instead.
-- 
Florian
