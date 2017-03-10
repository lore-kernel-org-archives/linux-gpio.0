From: Julia Cartwright <julia@ni.com>
Subject: Re: [PATCH 07/19] gpio: bcm-kona: make use of raw_spinlock variants
Date: Fri, 10 Mar 2017 13:35:29 -0600
Message-ID: <20170310193529.GC32162@jcartwri.amer.corp.natinst.com>
References: <cover.1489015238.git.julia@ni.com>
 <77d635877e765a6b4b0935debfe5836e554572c0.1489015238.git.julia@ni.com>
 <78b657c5-0f6a-6481-a0cf-e241c0632c7f@broadcom.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="VrqPEDrXMn8OVzN4"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx0a-00010702.pphosted.com ([148.163.156.75]:55953 "EHLO
        mx0b-00010702.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S933921AbdCJTfh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 10 Mar 2017 14:35:37 -0500
Content-Disposition: inline
In-Reply-To: <78b657c5-0f6a-6481-a0cf-e241c0632c7f@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ray Jui <ray.jui@broadcom.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-gpio@vger.kernel.org

--VrqPEDrXMn8OVzN4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 10, 2017 at 09:28:08AM -0800, Ray Jui wrote:
> Hi Julia/Linus,
>
> On 3/9/2017 8:21 AM, Julia Cartwright wrote:
> > The bcm-kona gpio driver currently implements an irq_chip for handling
> > interrupts; due to how irq_chip handling is done, it's necessary for the
> > irq_chip methods to be invoked from hardirq context, even on a a
> > real-time kernel.  Because the spinlock_t type becomes a "sleeping"
> > spinlock w/ RT kernels, it is not suitable to be used with irq_chips.
> >=20
> > A quick audit of the operations under the lock reveal that they do only
> > minimal, bounded work, and are therefore safe to do under a raw spinloc=
k.
>
> This is new to me. But it seems like, for the vast majority cases, user
> can still continue to use spin_lock as it is without needing to worry
> about the underlying difference between standard or RT kernels.

If by "user" you mean, "driver developer", then yes.  For most driver
authors, the distinction between raw and non-raw spinlocks is
irrelevant, they can use spinlocks and everything will work out just
fine w/ mainline and on RT.

> But in certain cases, e.g., irq_chips, extra care needs to be done,
> i.e., swtching to use raw spin lock to make sure that it is not
> blocking in the case of RT.

Correct, on RT the goal is to push as much as possible into a
preemptible context, including driver interrupts, etc.  However, there
are still codepaths which necessarily need to be executed in hardirq
context, including anything necessary to support scheduling.  This
includes: interrupt-dispatching (irq_chips), timers, and the scheduler
itself, which is why this "core" code must use the raw spinlock
variants.

> Is such API use change well accepted by the open source community
> already?

In what way is this an API change?  The API isn't changing, what's
changing in this patch is to fix what is an irq_chip implementation
which is _currently broken_ on RT.

   Julia

--VrqPEDrXMn8OVzN4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEgKAEF431w1EL96k9jNrC4UVNdG8FAljC//4ACgkQjNrC4UVN
dG/x5ggAvhT5tl0zoDREsBiBBablzKg3wl199DoDyvb0D3TRcas4H9oKA06Tz4qj
I3T1xWvynqDVPOhqi9xQEPOXNcCcbi45Jwf+ixjYZcb42aTKJWXu0iBixldGDYIQ
BpDAaW6CHhhWyVcL2ZeT33fMqOhBaAZLMpInzP9NLb6wVSyeWbF2dN/sILOMUPXn
DjTyRsju95+aKeyo1E21JHbAmFtgSmmdFGP52oqmrNJhfiek1NKhVFoe3iGjt0tf
Idq8FcbFJIhoXNnAGHYXY3WAXOcmTHs7HIJr85KdjUkemxNgAkc/MKTbEJbd23dH
6WSI6vrFjY7Oflm6BRQ0s0hC7zTXKQ==
=iVnh
-----END PGP SIGNATURE-----

--VrqPEDrXMn8OVzN4--
