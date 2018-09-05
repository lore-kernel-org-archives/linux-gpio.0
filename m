From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH mfd+gpio] Request (Linus Walleij + Lee Jones)
Date: Wed, 5 Sep 2018 11:36:39 +0200
Message-ID: <CACRpkda8iVV6-J14L95cioJEL2eGSra9uNbPL19F6N7ijnjZiA@mail.gmail.com>
References: <20180830144151.13417-1-marek.behun@nic.cz> <20180830164743.63c6e27d@nic.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180830164743.63c6e27d@nic.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: marek.behun@nic.cz
Cc: Lee Jones <lee.jones@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Aug 30, 2018 at 4:48 PM Marek Behun <marek.behun@nic.cz> wrote:

> Hi Linus and Lee,
> these two patches touch two different subsystems (mfd + gpio) and
> should be applyied one after another (the gpio part is dependant on the
> mfd part).
> The patches are based on mfd-next-4.19. I can send another copy based
> on gpio/devel.
> Could you two, Linus and Lee, work together on applying these patches?
> I don't know how this is usually solved...

If they need to go into the same merge window this is usually solved
by me ACKing the GPIO patches and Lee applying all of it to
the MFD tree then providing an immutable git branch to me if
I need the same changes in my tree.

Yours,
Linus Walleij
