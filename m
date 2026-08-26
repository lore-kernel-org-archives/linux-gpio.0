Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791053B840F;
	Wed, 26 Aug 2026 10:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787739313; cv=none; b=SvNPdsj1gMyNl4ThMpLfNZ6mJbKKC4vZcbtzXUCOCqxk5k2nNZmrhpDk4XrJOznzap9GK1VxDSiQzuCUa2J1KIKEcLE/oxXtq1T54/0cxiJ194v7f+Wgrv4wZmG4mdTXg3BKMqn6+dtWko3KZEgMyxhNDewWqNdOLscpLlFt3Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787739313; c=relaxed/simple;
	bh=vM5HfCdIN0W+FC2oAjmuQ7NPe4fDOvQMnI7qeQBPfDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hziNNS9cHp/BfmqBYeJvgY3EH2lq1e91GCDfwmly18HeUttlPUeuqSLK3NPqCvQ+B5XBi1V/y+dRQTXYoL/pbpod2YZpGwOD27Gu+bJCp1HiLp1wqwouPoF+irDIVWzBtnapIJmyuiLM/vkSC0ewydZRjYm/8fmldnd4akBHerk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YGtPOTFw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YGtPOTFw"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C77FD19C;
	Wed, 26 Aug 2026 12:13:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1787739221;
	bh=vM5HfCdIN0W+FC2oAjmuQ7NPe4fDOvQMnI7qeQBPfDQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YGtPOTFwZw41YbmWfHk17StA48t6cYc51KF8Dv++tFv1R6cB/Sai79pf3bxqTGY70
	 5itE0iTZ/ymVMUezH57ZumhpxEMX14xYXQxd8LVjtwE2VWXWurfKESQ0S4JUh5Koe5
	 xYp/0hfhf1x7YXyRrT88G2JFpXkq+l1wIOiA/WeU=
Message-ID: <d0537d7f-6e74-4cca-93ae-398530c5cd51@ideasonboard.com>
Date: Wed, 26 Aug 2026 13:15:03 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: dumitru.ceclan@analog.com
Cc: mitrutzceclan@gmail.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Martin Hecht <Martin.Hecht@avnet.eu>, Andrian Suciu
 <Adrian.Suciu@analog.com>, Cosmin Tanislav <demonsingur@gmail.com>,
 Vivekananda Dayananda <vivekana@amd.com>, Cory Keitz <ckeitz@amazon.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 07/08/2026 16:02, Dumitru Ceclan via B4 Relay wrote:
> This series adds new drivers for multiple Maxim GMSL2 and GMSL3 devices,
> replacing the few GMSL2 drivers already in upstream, and introducing a
> common framework that can be used to implement such GMSL chips, which
> avoids code duplication while also adding support for previously
> unsupported features.
If you send a series, it needs your Signed-off-by.

This series also depends on the internal pad, which is not upstream and 
is not just a straightforward add-a-define case. Sakari's "[PATCH v12 
00/86] Generic line based metadata support, internal pads" has it, and 
additional patches around it. For the time being, I think the internal 
pad unfortunately blocks merging this.

However, (correct me if I'm wrong) the internal pad is only required for 
TPG. An option would be to remove the TPG support (or at least the parts 
that make it visible, i.e. you could keep the internal functionality), 
thus removing the blocker. The TPG could be added later on top.

I tested the series on Xilinx Kria KV260 and on TI AM62A SK, both with
max96716 deserializer and two max96717 serializers with imx219. On 
Xilinx I used RAW8, with and without embedded data. On AM62A I used RAW8 
and RAW10.

The deserializer TPG gives me no frames at all. I recall the clocking 
for the TPG was quite a challenge on at least some max96 serializers, so 
maybe it's related to that.

The serializer TPG worked, although I think there's something funny with 
it: the initial frames (maybe just the first one) seem to be truncated a 
bit, there's black at the bottom. Another, a bit more unclear, is that 
sometimes ser tpg stops working. If I'm not mistaken, what I did was run 
cam0-tpg + cam1-tpg. Then I tried des tpg. Then cam0-tpg, but it gives 
me nothing. Streaming with cam0+cam1 video "resets" things and it all 
works again. I've seen this a few times, but there seems to be some 
randomness so I haven't been able to pinpoint it, but feels like there's 
some extra state that's left behind into the HW.

All in all, the normal case (non-tpg) works ok for me:

Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

