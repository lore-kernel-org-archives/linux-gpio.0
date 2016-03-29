From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: Re: [PATCH] gpio: pca953x: Use correct u16 value for register word write
Date: Tue, 29 Mar 2016 16:39:38 +0200
Message-ID: <1680089.6CCf2RWg8O@ws-stein>
References: <1459232852-15697-1-git-send-email-sdliyong@gmail.com> <56FA6FB6.4040003@electromag.com.au> <CADO9-pdhTOmg9OMgz+K++Gc3mCxbi7KF23kA8zsftVeDTR3SSw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from webbox1416.server-home.net ([77.236.96.61]:49817 "EHLO
	webbox1416.server-home.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932375AbcC2Ojo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Tue, 29 Mar 2016 10:39:44 -0400
In-Reply-To: <CADO9-pdhTOmg9OMgz+K++Gc3mCxbi7KF23kA8zsftVeDTR3SSw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Yong Li <sdliyong@gmail.com>, linux-gpio@vger.kernel.org, Phil Reid <preid@electromag.com.au>

You missed CC'ing Phil (Added for this post)

On Tuesday 29 March 2016 20:53:58, Yong Li wrote:
> Thanks for your comment, I think I can change it to val[0] | (val[1]
> << 8), is it okay ?

Mh, currently there is only one caller (device_pca953x_init) which passes only 
0, 0 or 0xff, 0xff, so endianess is irrelevant. But to be future proof this 
should be done in an endian-safe manner. Though cpu_to_le16p does not work, 
due to same alignment problem as casting to u16*.

Best regards,
Alexander

