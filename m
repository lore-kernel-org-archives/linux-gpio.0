From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: Question about patch "pinctrl: cherryview: Do not mask all
 interrupts on probe"
Date: Wed, 2 Sep 2015 10:36:33 +0300
Message-ID: <20150902073633.GD1609@lahna.fi.intel.com>
References: <CA+A7VXVOpLCvk3YLWq9=ESKGRUg3E+rBOV65eEEkw-TOTaCavQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:24986 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750776AbbIBHgh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 2 Sep 2015 03:36:37 -0400
Content-Disposition: inline
In-Reply-To: <CA+A7VXVOpLCvk3YLWq9=ESKGRUg3E+rBOV65eEEkw-TOTaCavQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?iso-8859-1?Q?Jo=E3o?= Paulo Rechi Vita <jprvita@gmail.com>
Cc: linux-gpio@vger.kernel.org, yu.c.chen@intel.com

On Tue, Sep 01, 2015 at 04:09:12PM -0400, Jo=E3o Paulo Rechi Vita wrote=
:
> Hello Mika,
>=20
> About a month ago I've sent a message [1] to linux-gpio querying abou=
t
> the state of the patch mentioned on the subject, which you had sent
> and later resigned. It seems I've failed to address my message while
> trying to send it through gmane as a reply to the original message, a=
s
> it did not get to your attention.

Looks like I never got that email.

> [1] https://www.mail-archive.com/linux-gpio%40vger.kernel.org/msg0909=
3.html
>=20
> I'm working on a ASUS E202SA laptop, in which the brightness keys
> depend on this patch to work. Are any plans to have it integrated, in
> the original form or in any other?

Adding Yu to the loop.

Yu was investigating alternative ways to fix this. Did you come to
some conclusion?
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
