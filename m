From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: pinctrl: -EAGAIN not supported but documented
Date: Mon, 21 Jan 2019 15:26:57 +0100
Message-ID: <CACRpkdYPBf6sYzbk1W-znYxaaaGvvO=tT_rXt7SXBwDRa6fJ1w@mail.gmail.com>
References: <94b9acab-a739-a014-b068-768f40de38ec@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <94b9acab-a739-a014-b068-768f40de38ec@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ramon Fried <ramon.fried@linux.intel.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jan 21, 2019 at 2:28 PM Ramon Fried <ramon.fried@linux.intel.com> wrote:

> Stated in Documentation/driver-api/pinctl.rst:
>
> Since some controllers have special logic for handling entire groups of pins
> they can exploit the special whole-group pin control function. The
> pin_config_group_set() callback is allowed to return the error code -EAGAIN,
> for groups it does not want to handle, or if it just wants to do some
> group-level handling and then fall through to iterate over all pins, in
> which
> case each individual pin will be treated by separate pin_config_set()
> calls as
> well.
>
> ----
>
> This is not supported, and there's no code for handling it.
>
> Should we add the necessary code or just remove the wrong documentation.

The idea was removed in:
commit ad42fc6c84795d19972e7f7dee70fe74bec4c2d8
"pinctrl: rip out the direct pinconf API"

I think we should just remove the documentation.

Do you want me to look into it or do you want to send a patch?

Yours,
Linus Walleij
