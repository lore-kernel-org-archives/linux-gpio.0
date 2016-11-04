From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 1/3] pinctrl: cherryview: Serialize register access in
 suspend and resume hooks
Date: Fri, 4 Nov 2016 17:28:21 +0200
Message-ID: <20161104152821.GS1436@lahna.fi.intel.com>
References: <20161031145734.193016-1-mika.westerberg@linux.intel.com>
 <CACRpkdYTjFBj4EAvFWtaAu7aaxbKkXy6HffXOzAnBCPKehWRtQ@mail.gmail.com>
 <CACRpkdbgvVzv0YVmt7CQ6uwnsAtLnNoFJs6a8vopngb6CQVFqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbgvVzv0YVmt7CQ6uwnsAtLnNoFJs6a8vopngb6CQVFqQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Christian Steiner <christian.steiner@outlook.de>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Nov 04, 2016 at 04:15:59PM +0100, Linus Walleij wrote:
> On Fri, Nov 4, 2016 at 4:12 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Mon, Oct 31, 2016 at 3:57 PM, Mika Westerberg
> > <mika.westerberg@linux.intel.com> wrote:
> >
> >> If async suspend is enabled, the driver may access registers concurrently
> >> with another instance which may fail because of the bug in Cherryview GPIO
> >> hardware. Prevent this by taking the shared lock while accessing the
> >> hardware in suspend and resume hooks.
> >>
> >> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> >
> > Patch applied.
> 
> Mika should this and patch 2/3 be tagged for stable?

Yes, I think they should.
