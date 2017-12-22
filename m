From: Andrew Cooks <andrew.cooks@opengear.com>
Subject: Re: pinctrl-amd: What hardware does it apply to?
Date: Fri, 22 Dec 2017 10:44:06 +1000
Message-ID: <669cceb3-3225-f93a-41bf-5ad9dc22e7fe@opengear.com>
References: <6c675643-45ec-c57f-f1b2-afb25f3e947e@opengear.com>
 <CACRpkdaHj8SFL5AfSkAqDG0mHpgRVbmHuyrhwMUkEH2c4p0VDg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaHj8SFL5AfSkAqDG0mHpgRVbmHuyrhwMUkEH2c4p0VDg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nehal Shah <Nehal-bakulchandra.Shah@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Ken Xue <Ken.Xue@amd.com>, Tobias Diedrich <ranma+kernel@tdiedrich.de>, Sudheesh Mavila <sudheesh.mavila@amd.com>, platypus-sw <platypus-sw@opengear.com>, Timur Tabi <timur@codeaurora.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus

On 21/12/17 20:11, Linus Walleij wrote:
> Hi Andrew!
> 
> Thank you for your mail!
> 
> On Wed, Dec 20, 2017 at 11:25 PM, Andrew Cooks
> <andrew.cooks@opengear.com> wrote:
> 
>> Another driver (gpio-sb8xx) was submitted for upstream inclusion, but was
>> knocked back with the suggestion that pinctrl is the way forward[3].
> 
> Hm I cannot follow link [3] right now. And I don't remember the submission :(
> It doesn't seem to be in my mail archives either.

Here's the same thread in a different list archive: https://marc.info/?t=143483759600001&r=1&w=2

> 
> Timur Tabi from CodeAurora is currently
> floating a patch set that makes it possible to remove entire sets of
> lines as "controlled by someone else" (read: ACPI BIOS).
> This will apply to the whole GPIO chip.
> https://marc.info/?l=linux-gpio&m=151379704013464&w=2
> 
> This is however under heavy discussion.

Thanks, I'm following that discussion.


Andrew
