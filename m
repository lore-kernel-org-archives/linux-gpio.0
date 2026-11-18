Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020572;
	b=yGiUrt/v2ApQsmo/LNfKwMqwsokFcDpYzsGfprTpSFO/rx0dj1AW/PJ1K9rYQClF1Gxm
	 h4C4HcMAmi2F1CoLq+4X9JV6pzFcaZ93eYNgfBay/uo5ZFGfaq5KqlgyC+M69yBhDcWxR
	 9xGOcZY9RZGSMUAwvempdZq1kFDFweEORLUSybUdzrYJ+AR8VNU41Kyob4m7XYIFeMVXA
	 FnrlBenRvNY9IcOiQE+LfFzXR/6/kXZl8dijptoZ5kVb45MzC8skyDuYotPTp833TMwIy
	 TiNCLDMI3kP0VivFG9zS/n69qz3+x53Rtc5p8m6Yzu22Ga5gpU5xTVgMtm87H/A2PPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020572;
	h=DMARC-Filter:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
	 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 User-Agent:MIME-Version:Content-Type;
	bh=CypiicFre4WBwXpeVK7ccOtlft0aGSxKx03rsPEEj/g=;
	b=lALGoGoVCWaEbFv/BZImJsVj2tGG/770qS10UFq9KcDlh9O9XGO5M59GnvW6LT9w5baK
	 xEhlig9+NE1dzOt7l22i2ME7MqxuOfceReBKmwgoeKlBuwctF1SnwToMNuKJAvHIF8vQd
	 PsMEmkTSx/Auy3QIuvnlY8LTY7MKTUBWRhj8x/tgvC+JBMNKxw1TA2lybj/9qU9ii/4wl
	 ZD1urv+tza9t33m0zlKq4psZQKhR0XfS5zQuMlccG6MweOiJQqgtaol8MBKrhNEmXZHVy
	 YJqrIODLbXp/cnUOEtCKyFJ4skmtCeFRLdk0qjFjlXlVumRZVz+igFMltnUJGKJpbkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=korsgaard.com;
	spf=pass smtp.mailfrom=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=ity7tghI;
	arc=none smtp.remote-ip=34.202.193.197
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99107606A320
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 16:49:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99107606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=ity7tghI
DKIM-Signature: a=rsa-sha256; b=ity7tghIOZYfLhjtTnV5SWFkqmvLqm0FUum++BlONR49TMGyIQgT/rTgYsm3cuuFnV920idQQl1LzUy/GTFscKBAp6v1JpPk8aTrETB/HlYJg1gNZTXztNf7AOC3F8U5RD1+f2ItUnprJ0DQlMguQMtvGzpWUElzqa3zpQh0Owj0HF5NHxsv9X1RIgfcAprXbNxwg2gEuLkQHvjRpb+e5EyFANs8DHcleV6AcGJ3As0EW2y+ThBKkyukbkU8HZHkABVEOAAyAkx8CqnnHHCMIEg9GqGab2DiCzZMc8cQ2lwJZt611breWeD8XcK8nFst2nG7zvoF0FvEyUBkg/ZDgA==; s=purelymail1; d=purelymail.com; v=1; bh=PwCwEuAB6fs515WLXtAULsh+c1exq0+R5yemtdnUvHA=; h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID;
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: linux-gpio@vger.kernel.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 91259422;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Wed, 18 Nov 2026 16:49:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
	(envelope-from <peter@korsgaard.com>)
	id 1xTiqU-00000000BtX-2E5A;
	Wed, 18 Nov 2026 17:49:18 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Cc: Linus Walleij <linusw@kernel.org>,  Michal Simek <michal.simek@amd.com>,
  <linux-gpio@vger.kernel.org>,  <linux-arm-kernel@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>,  <saikrishna12468@gmail.com>,
  <git@amd.com>
Subject: Re: [PATCH v2] pinctrl: zynqmp: Ensure function names are NUL
 terminated
In-Reply-To: <20261118111816.2483052-1-sai.krishna.potthuri@amd.com> (Sai
	Krishna Potthuri's message of "Wed, 18 Nov 2026 16:48:16 +0530")
References: <20261118111816.2483052-1-sai.krishna.potthuri@amd.com>
Date: Wed, 18 Nov 2026 17:49:18 +0100
Message-ID: <87mrr6ultd.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

>>>>> "Sai" == Sai Krishna Potthuri <sai.krishna.potthuri@amd.com> writes:

 > PM_QID_PINCTRL_GET_FUNCTION_NAME returns the function name in a fixed
 > 16-byte field and does not guarantee NUL termination. A 16-character
 > name fills the entire field.
 > The driver copies this field into a 16-byte buffer and subsequently
 > uses it as a C string. For a non-NUL-terminated name, string operations
 > can read past the end of the buffer into the adjacent groups pointer.

 > Reserve an extra byte for the NUL terminator and explicitly terminate
 > the copied function name.

 > Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
 > ---
 > changes in v2:
 > - Replace macro/constants with sizeof()(comment from David Laight)

Reviewed-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard
