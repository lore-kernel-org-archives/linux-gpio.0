From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] pinctrl: Really force states during suspend/resume
Date: Mon, 27 Feb 2017 10:53:39 -0800
Message-ID: <f11eec90-73c9-7bd7-9fa6-3015f5c64476@gmail.com>
References: <20170208011759.15478-1-f.fainelli@gmail.com>
 <CACRpkda=EhP9a7rGCJPz9fSjGcypxgXh2B-YWXbuCMcPRRwEEQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkda=EhP9a7rGCJPz9fSjGcypxgXh2B-YWXbuCMcPRRwEEQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: alcooperx@gmail.com, Stephen Warren <swarren@nvidia.com>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 02/23/2017 02:23 AM, Linus Walleij wrote:
> Hi Florian, a big sorry for not looking into this earlier, I've been
> having a mess in my inbox... and too much fun with the Gemini
> hehe :)
> 
> On Wed, Feb 8, 2017 at 2:17 AM, Florian Fainelli <f.fainelli@gmail.com> wrote:
> 
>> In case a platform only defaults a "default" set of pins, but not a
>> "sleep" set of pins, and this particular platform suspends and resumes
>> in a way that the pin states are not preserved by the hardware, when we
>> resume, we would call pinctrl_single_resume() -> pinctrl_force_default()
>> -> pinctrl_select_state() and the first thing we do is check that the
>> pins state is the same as before, and do nothing.
>>
>> In order to fix this, decouple pinctrl_select_state and make it become
>> __pinctrl_select_state(), taking an additional ignore_state_check
>> boolean which allows us to bypass the state check during suspend/resume,
>> since we really want to re-apply the previous pin states in these case.
>>
>> Fixes: 6e5e959dde0d ("pinctrl: API changes to support multiple states per device")
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> 
> 
>>  /**
>> - * pinctrl_select_state() - select/activate/program a pinctrl state to HW
>> + * __pinctrl_select_state() - select/activate/program a pinctrl state to HW
>>   * @p: the pinctrl handle for the device that requests configuration
>>   * @state: the state handle to select/activate/program
>> + * @force: ignore the state check (e.g: to re-apply default state during
>> + * suspend/resume)
>>   */
>> -int pinctrl_select_state(struct pinctrl *p, struct pinctrl_state *state)
>> +static int __pinctrl_select_state(struct pinctrl *p,
>> +                                 struct pinctrl_state *state,
>> +                                 bool ignore_state_check)
> 
> OMG no __prefix functions I'm allergic to that :D
> 
> Just come up with a new name that describe what this function is
> really doing. I'm picky about syntax matching semantics.
> Name it pinctrl_commit_state() if nothing better comes to mind.
> 
>>  static void devm_pinctrl_release(struct device *dev, void *res)
>> @@ -1236,7 +1250,8 @@ void pinctrl_unregister_map(struct pinctrl_map const *map)
>>  int pinctrl_force_sleep(struct pinctrl_dev *pctldev)
>>  {
>>         if (!IS_ERR(pctldev->p) && !IS_ERR(pctldev->hog_sleep))
>> -               return pinctrl_select_state(pctldev->p, pctldev->hog_sleep);
>> +               return __pinctrl_select_state(pctldev->p,
>> +                                             pctldev->hog_sleep, true);
>>         return 0;
>>  }
>>  EXPORT_SYMBOL_GPL(pinctrl_force_sleep);
>> @@ -1248,7 +1263,8 @@ EXPORT_SYMBOL_GPL(pinctrl_force_sleep);
>>  int pinctrl_force_default(struct pinctrl_dev *pctldev)
>>  {
>>         if (!IS_ERR(pctldev->p) && !IS_ERR(pctldev->hog_default))
>> -               return pinctrl_select_state(pctldev->p, pctldev->hog_default);
>> +               return __pinctrl_select_state(pctldev->p,
>> +                                             pctldev->hog_default, true);
> 
> OK makes sense.
> 
> If you respin with a better function name I will queue it for fixes.
> 
> I guess also CC stable if you have problems with older kernels
> including v4.10 at this point... sorry if I created a mess.

Sounds good, let me respin a patch with the pinctrl_commit_state() used
as a name (could not come up with a better one).

Stay tuned.
-- 
Florian
