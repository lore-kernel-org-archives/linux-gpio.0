From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] pinctrl: Really force states during suspend/resume
Date: Wed, 8 Feb 2017 14:09:01 -0800
Message-ID: <b7de2a76-3e53-b6c4-daf1-88a0eace5a24@gmail.com>
References: <20170208011759.15478-1-f.fainelli@gmail.com>
 <CAHp75VejE9ofBBSbKraon96pWDg7a00TJgViS-m6BGO4p0_E8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VejE9ofBBSbKraon96pWDg7a00TJgViS-m6BGO4p0_E8A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Al Cooper <alcooperx@gmail.com>, swarren@nvidia.com, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 02/08/2017 01:46 PM, Andy Shevchenko wrote:
> On Wed, Feb 8, 2017 at 3:17 AM, Florian Fainelli <f.fainelli@gmail.com> wrote:
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
>> ---
>> Linus,
>>
>> This is against your "fixes" branch, thank you!
> 
> Btw, I have got similar issue and thinking about those states they are
> quite orthogonal to the pin states. Wouldn't be better to actually
> differentiate PM related states and pin states?

This is the first time that I had to look that deep in
drivers/pinctrl/core.c, so you and Linus would probably know better
about how to get this fixed properly, this was simple enough it could be
backported to -stable kernels would that be a valid fix.

> 
> In my case I have a ->probe() function where device is requested GPIO
> in order to make it wake capable source without using anywhere else.
> So, this requires to have "init" state to be defined which is kinda
> inconvenient.
> 
> On resume/suspend it calls pinctrl_pm_state*() and requires "default"
> and "sleep" states to be defined.
> 
> I think GPIO case is quite generic and pin control framework lacks of
> something like switching some pins of the group to GPIO state and back
> whenever they defined as wake capable sources.
> 
> I would work towards fixing this issue anyway (to get UART runtime PM
> working on serial consoles).

Would this proposed patch here fix your case, or do you need to address
it differently because these are GPIOs and not a simple pinctrl-single
DT node with just a default function?

> 
>>
>>  drivers/pinctrl/core.c | 26 +++++++++++++++++++++-----
>>  1 file changed, 21 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
>> index fb38e208f32d..8b8017dc9e15 100644
>> --- a/drivers/pinctrl/core.c
>> +++ b/drivers/pinctrl/core.c
>> @@ -992,17 +992,21 @@ struct pinctrl_state *pinctrl_lookup_state(struct pinctrl *p,
>>  EXPORT_SYMBOL_GPL(pinctrl_lookup_state);
>>
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
>>  {
>>         struct pinctrl_setting *setting, *setting2;
>>         struct pinctrl_state *old_state = p->state;
>>         int ret;
>>
>> -       if (p->state == state)
>> +       if (p->state == state && !ignore_state_check)
>>                 return 0;
>>
>>         if (p->state) {
>> @@ -1068,6 +1072,16 @@ int pinctrl_select_state(struct pinctrl *p, struct pinctrl_state *state)
>>
>>         return ret;
>>  }
>> +
>> +/**
>> + * pinctrl_select_state() - select/activate/program a pinctrl state to HW
>> + * @p: the pinctrl handle for the device that requests configuration
>> + * @state: the state handle to select/activate/program
>> + */
>> +int pinctrl_select_state(struct pinctrl *p, struct pinctrl_state *state)
>> +{
>> +       return __pinctrl_select_state(p, state, false);
>> +}
>>  EXPORT_SYMBOL_GPL(pinctrl_select_state);
>>
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
>>         return 0;
>>  }
>>  EXPORT_SYMBOL_GPL(pinctrl_force_default);
>> --
>> 2.9.3
>>
> 
> 
> 


-- 
Florian
