From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: Don't just pretend to protect pinctrl_maps, do
 it for real
Date: Wed, 6 May 2015 16:25:19 +0200
Message-ID: <CACRpkdbb320-fKbrEb075gDhD=A_16huZaO06KDmL-1F9Xx+dQ@mail.gmail.com>
References: <1430496088-5374-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430496088-5374-1-git-send-email-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Patrice Chotard <patrice.chotard@st.com>, Stephen Warren <swarren@wwwdotorg.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Heiko Stuebner <heiko@sntech.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, May 1, 2015 at 6:01 PM, Doug Anderson <dianders@chromium.org> wrote:

> Way back, when the world was a simpler place and there was no war, no
> evil, and no kernel bugs, there was just a single pinctrl lock.  That
> was how the world was when (57291ce pinctrl: core device tree mapping
> table parsing support) was written.  In that case, there were
> instances where the pinctrl mutex was already held when
> pinctrl_register_map() was called, hence a "locked" parameter was
> passed to the function to indicate that the mutex was already locked
> (so we shouldn't lock it again).
>
> A few years ago in (42fed7b pinctrl: move subsystem mutex to
> pinctrl_dev struct), we switched to a separate pinctrl_maps_mutex.
> ...but (oops) we forgot to re-think about the whole "locked" parameter
> for pinctrl_register_map().  Basically the "locked" parameter appears
> to still refer to whether the bigger pinctrl_dev mutex is locked, but
> we're using it to skip locks of our (now separate) pinctrl_maps_mutex.
>
> That's kind of a bad thing(TM).  Probably nobody noticed because most
> of the calls to pinctrl_register_map happen at boot time and we've got
> synchronous device probing.  ...and even cases where we're
> asynchronous don't end up actually hitting the race too often.  ...but
> after banging my head against the wall for a bug that reproduced 1 out
> of 1000 reboots and lots of looking through kgdb, I finally noticed
> this.
>
> Anyway, we can now safely remove the "locked" parameter and go back to
> a war-free, evil-free, and kernel-bug-free world.
>
> Fixes: 42fed7ba44e4 ("pinctrl: move subsystem mutex to pinctrl_dev struct")
> Signed-off-by: Doug Anderson <dianders@chromium.org>

GOOD CATCH.

Patch applied for fixes.

Yours,
Linus Walleij
