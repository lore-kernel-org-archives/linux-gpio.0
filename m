From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 2/3] pinctrl: msm: Use init_valid_mask exported function
Date: Wed, 10 Oct 2018 10:30:04 +0200
Message-ID: <CACRpkdaH4zBj9fpWw0KfviF-RPuw5rTLDn5pCNFBdW92vVM+iw@mail.gmail.com>
References: <20181005065300.22882-1-ricardo.ribalda@gmail.com> <20181005065300.22882-2-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181005065300.22882-2-ricardo.ribalda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: jhugo@codeaurora.org, timur@kernel.org, Stephen Boyd <swboyd@chromium.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Oct 5, 2018 at 8:53 AM Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:

> The current code produces XPU violation if get_direction is called just
> after the initialization.
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

Patch applied with Timur's ACK.
The code makes perfect sense.
I hope Bjorn has no reservations, if he does I guess I have to
just back it out.

Yours,
Linus Walleij
