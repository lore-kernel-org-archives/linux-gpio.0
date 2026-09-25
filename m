Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E656649C4D8;
	Fri, 25 Sep 2026 11:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790336573; cv=none; b=sT6Q559gIV5gk6o6mi7bd6WVdjPJ8T4ke7hscxcHE0MOcvQtVzJLPxW8RsySRb6KUg/PwcvBpRE5y3omlxiUG8eIHkBPKUOgYR4YCDL/D37Aa8W7rwrpVfubGWHP9A4MYX3EOgv77COdzqG1gpysaXGc20UqsXnEh8BEJ3XPjsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790336573; c=relaxed/simple;
	bh=rvaM5HwVc+gtfOyGRjfwyFNoCaVIGpHSBMyZgg0r5yA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AJZ/vs0eMniV1jz8WT4UDovXZv0QE45thh1aKLb4ahkB4V3JQPfygXZ1XHc4mow0KxNzmqplNbpeUXVoKRapCwukguA+wDLB6fiwCjYOdD0rx2nXDCRm0Z99b+dE1Ll2n2GbW5NfjTgUXhD9NOlKShv9SzbvPk59BTADgefsM8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UuyfcqW9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UuyfcqW9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08D7E1F00898;
	Fri, 25 Sep 2026 11:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790336571;
	bh=Y/9K9ldsMvxaefN09e8/WtwnfBKf+2irb3NM4WdnkTA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=UuyfcqW9GC4SuTTpiZzfW5A0uAhX/RpZokkfsF0zrpvAj8HaTBzRRMgqT0VQ29oNu
	 EbWH3EZO2ffT/U9hiLyZcGImHSzRHhaFxW40RFenfpFrYGZU0scmC72DMy0TOw5xHi
	 nqI/a71F0DKQVaZPJEvMInAI7SfJQRfsZXb95myVvyi1mFCMMbsZYNeCxCPXMGQG5l
	 CMzBSSN5VMzLPTetFg8cZeFvTwPyuZl0D0TRJmQKzRJBPw6Eq0JYzxhjE4Qdw88YvQ
	 CJ14Sq0j/yjGxEzPkVcwycj1JbZswQeX+NwzeDdux3YPjcNy017j/ioqBQY/hlxQZ4
	 bUHCOtwh9hU4g==
Message-ID: <1299262d-a9f0-4f2d-8456-bb40a3078f95@kernel.org>
Date: Fri, 25 Sep 2026 13:42:47 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] gpio: move intel drivers into their own directory
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>,
 Lixu Zhang <lixu.zhang@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
 Mika Westerberg <westeri@kernel.org>,
 Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260925-gpio-organize-by-vendor-v1-1-8feefd60581b@oss.qualcomm.com>
 <arZRZfa7AmDxmwoJ@ashevche-desk.local>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <arZRZfa7AmDxmwoJ@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 25-Sep-26 12:48, Andy Shevchenko wrote:
> On Fri, Sep 25, 2026 at 12:22:15PM +0200, Bartosz Golaszewski wrote:
>> In order to avoid maintainer mistakes on patch ownership: move all the
>> Intel drivers into their own dedicated directory under
>> drivers/gpio/intel. Don't touch Kconfig options as we historically sort
>> GPIO drivers by type, not by vendor.
> 
> ...
> 
>>  drivers/gpio/{ => intel}/gpio-graniterapids.c   |  0
>>  drivers/gpio/{ => intel}/gpio-novalake-events.c |  0
> 
> These are interesting drivers, not sure where to put them
> 
>>  drivers/gpio/{ => intel}/gpio-ljca.c            |  0
>>  drivers/gpio/{ => intel}/gpio-usbio.c           |  0
> 
> These are definitely not going to intel subfolder, they have nothing to do with
> Intel HW, they are against some custom external (to Intel SoC) HW.

Hmm, those "external" SoCs are only found on Intel IPU6/IPU7 laptops
and come from camera designs for OEMs done by Intel's camera team.

I don't care much either way, but for all intent and purposes these
really are Intel USB GPIO expander drivers.

Regards,

Hans


