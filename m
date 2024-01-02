Received: from wormhole.robuust.nl (leaseweb-ip1.robuust.nl [178.162.147.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8D1C11C93
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jan 2024 14:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opensourcepartners.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wormhole.robuust.nl
Received: from costar (helo=localhost)
	by wormhole.robuust.nl with local-esmtp (Exim 3.36 #1 (Debian))
	id 1rKg6B-0005Av-00; Tue, 02 Jan 2024 15:50:31 +0100
Date: Tue, 2 Jan 2024 15:50:31 +0100 (CET)
From: "J.A. Bezemer" <j.a.bezemer@opensourcepartners.nl>
X-X-Sender: costar@wormhole.robuust.nl
To: Kent Gibson <warthog618@gmail.com>
cc: linux-gpio@vger.kernel.org, brgl@bgdev.pl
Subject: Re: [libgpiod][PATCH] line-config.c: Fix library enum used for kernel
 flags bitfield
In-Reply-To: <20231231020228.GA8143@rigel>
Message-ID: <Pine.LNX.4.64.2401021546300.16108@wormhole.robuust.nl>
References: <Pine.LNX.4.64.2312301347330.29540@wormhole.robuust.nl>
 <20231231015727.GA3304@rigel> <20231231020228.GA8143@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII


On Sun, 31 Dec 2023, Kent Gibson wrote:
> On Sun, Dec 31, 2023 at 09:57:27AM +0800, Kent Gibson wrote:
>> On Sat, Dec 30, 2023 at 01:48:53PM +0100, J.A. Bezemer wrote:
>>> Library enum was used to sanitize kernel flags.
>>>
>>
>> Rephrase to make imperative and better describe what is being fixed.
>> e.g.
>>
>> "Fix deselection of output direction when edge detection is selected in
>> make_kernel_flags(). Use correct flag to perform deselection rather than
>> a library enum."
>>
>
> While I think if it, that also applies to the subject line.
> And that should probably begin with "core:" as it indicates the section
> of the code tree being modified.
>
> Sorry - more nitpicking.

Hi Kent, thanks for the guidance. Keeping a high standard is very much
appreciated. Updated version upcoming.

Regards,
Anne Bezemer
