Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D3045D19E
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 09:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984747; cv=none; b=AfvrhixGRZV293pLADAyffqsluHSQnymfHzbdRKWhZCb9k7r1yLkap3q2HyWsABEfpIgAdlSMzUsyoaYNQD0ZVj91qrVSZLSDQkHxrQ07n1MRPB/nUsa/pbLDKppzMT5cC1iLgXwXb0UohBwr90Fu88rD+VrBPWIQHpkOLlPcPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984747; c=relaxed/simple;
	bh=WmFJPtdFYdnGcwlHNzNN3tYjm2T7GMzpZqyhPPx11fc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q14xinz6gH1VKvmpKTWuFATFm6nM4OVWaqxtsZuGIizcuFPp1X8ZPwe+neXfiOzpO5C+QZjZC9qicjINA+MhLU0O8x9T2kDrHdMACtbTn/t5Hvg4oE7mtQ8/DullhC/yzaPy3tty0HfCcdNzKXmwRz4lH+4QIgE/4lBZMUL+Geg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RGutI7gu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IJEOqobM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RGutI7gu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IJEOqobM"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L7F4kX957140
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 09:59:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iMsr4uUML7hRoBuH1bAw7OEo14ti1q8U4IsGrItFVHk=; b=RGutI7gusdvrhfzS
	bZyVqs/jQzYdnkqB9t8x9P8YmWzFeAIx2+qGTjuYpxNKz8L0kz01+ZwbeFldPRQa
	dGgNkONqTnuGl7Ibnhb4xrrd0lw9bgEdmmI7GjAQnwnFQa60kKa0Khe1h0xEutYo
	LFu1FogHQjVRapOZ5A02WuZNf/me/vFQw/18STQnmlMdf1WdcH6HaK704uGcLmkV
	dvsBJEPHkvw4+1e07MLJ6TJuPx67QocyBq31sJ+/azZ8osN61XuervFiyrJMrTDt
	0NPD/CuvryvPCp8MCxwAreLiRwecoBsXdvXmlDhzAu1mpiMEh/+6Wzq0fFjeL7CU
	pjgWFQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu01d0nc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 09:59:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93bd22160bbso164816785a.1
        for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 02:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789984744; x=1790589544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iMsr4uUML7hRoBuH1bAw7OEo14ti1q8U4IsGrItFVHk=;
        b=IJEOqobMPDgbI49G45NSb5aDBhTsUvB8cQjtwbutjFMrmq7VEV/7PDgtOURPT7z+N8
         sXCTK+bdpcg9ImbDOtuuEOEF6kxC0rqyY0DXQI1SkSFIiEpVPD9MuKrwpow4wVOOrL+3
         ebFrul3Y1tHetgsVU8dxzKtyUp207xKOwF/wCciXh2MgS6Z2+oIWY2H9SA6CF6Yv44uQ
         Cj2nRYk/nTu919O3RpMVvCw6n0H0djW/k1SUVaR8hPiySkC0840ELkUSLV1W+B5vDMdK
         ohySgurX746YYuVFn6WmDF8dXORST6UtdVasnHggxvhir1dNdHuDJEx3osOYftSugXnd
         SUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789984744; x=1790589544;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iMsr4uUML7hRoBuH1bAw7OEo14ti1q8U4IsGrItFVHk=;
        b=IsOOI8tX7faDk+CfnxJiL+9TLCf0TvgGLkHY775x9/Kn47HvJu15GVqvXJBeCtvxOS
         kbgMe2O0xojphvX5KXp5R2pgZLF3zKn0e9Fycnhtb/3TPdFJ2XsMwOgsK36E314bmVlT
         eSz5zeB+OVbULeXfX9qHs7AsnihNJRIKNM0VNC86Qv8lUnnDlZ0vxAZRci4Hg1vEZWD4
         NB0aB4m/9QWUBXQY73nNHt4jmTwhf9W8yT6YAuK81F80+/jZMrd39G6QvUCZ4//gzfuL
         l6RDZR9BgJWoXz75Z5HYfgQCgdtx1NY2OhLRkW7G3GrdFhU2pv0aV7jHtJ6RTl6oVvJ9
         KF4w==
X-Gm-Message-State: AFuF++nh6ScSyxBAAED7u//5u2Edcnku19jXTb3VBCOvmDYaCCfHUhBS
	kRWlXBJ+Y8tiP9NxiQZ6yCbVJVFskcHt4xNHcUoViplIjC9ZjN5PoRpPp+s00Amr3RjC5g286UF
	/ZbkKD32h6iKcWWKpcvYGkma0keuCvwuVO9QHtpnJVJ6GJNWY0JuF9aa8x8GTEGS6
X-Gm-Gg: AYBFou06VMKw4HWDLztPg3tla4lKV5Y39j6GHKonAbssE8I5Fyk2RVIXQdYs8P2PgZu
	Evx16lHWlZl0kw2xFBXu9mGxS5NBwfmKC/uoJE+YWoPhlwG0GYg1DMDv1wxxdagwAMOWxAPmyFO
	Fiqa/7HAvwe1fg7K7uwkYoI2ZKc/2msJZVsYMev41OCo+q8rBF7QWieBkV1Nc1kZK0MTyxk9z6O
	wPOwHoST5Q9S0GjPfhty/EjmZeC8bWElhN5suWflW6x7Cxrt2zSUV4uXT5ZPUpU3lNMK2KZ3chX
	YooJUxhK0gb20x1CMPjJRT76OOLLo3mr+k+mC2EI3R54GYgO1bLVbhZxS0jpKGZ40BoFSemA2x2
	k31zPxIIYOBQZHMIdQtkQzpi05Q==
X-Received: by 2002:a05:620a:470e:b0:939:fc18:4231 with SMTP id af79cd13be357-93bf55af02fmr974990585a.27.1789984744407;
        Mon, 21 Sep 2026 02:59:04 -0700 (PDT)
X-Received: by 2002:a05:620a:470e:b0:939:fc18:4231 with SMTP id af79cd13be357-93bf55af02fmr974988185a.27.1789984744024;
        Mon, 21 Sep 2026 02:59:04 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67dd344asm3991062a12.18.2026.09.21.02.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:59:03 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>, Vincent Fazio <vfazio@xes-inc.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Wierich <erik@riscstar.com>, Phil Howard <phil@gadgetoid.com>,
        brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod] README: move SPDX boiler-plate into REUSE.toml
Date: Mon, 21 Sep 2026 11:59:00 +0200
Message-ID: <178998473827.61803.2232324864957679709.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916-libgpiod-readme-licensing-v1-1-1221405d6840@oss.qualcomm.com>
References: <20260916-libgpiod-readme-licensing-v1-1-1221405d6840@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vFDnr60-LOStyO6SRMm94GBORbjtePvs
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE0NCBTYWx0ZWRfX7PdvapCFt3wf
 lKnnahBHdorhXwS0Cz8HvV4ACS0IVC2FddLwnHsCg7XD854rJYoQsHN7agWKDyVoFywQYzItMFV
 sLv1ITvQ30nKUu0wvjkC2Aej+H0HNrU=
X-Proofpoint-GUID: vFDnr60-LOStyO6SRMm94GBORbjtePvs
X-Authority-Analysis: v=2.4 cv=Ht7jiETS c=1 sm=1 tr=0 ts=6ab0ffe8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lkRoejrxHZVCiRKxfeoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE0NCBTYWx0ZWRfXydJzRnws5RXs
 oxGFoppRrbphrafCwaxSXUG0WbD7F5lGkingwthhLbda6LHinXZfIc5AGDn3vcQMiALrFwePzXS
 d9hdsltnIPnlu6NKqay9lFna+agD4pXyB9cNpSdaB1id6bdLvJiC4Zr7O3OFGBD01SAbYenFIhJ
 kMXcTtY6ReoCkNV1u3XUewAeXTYPMhM3hnoVlwbwuzVEc/uYbfLccSc0wBtlCAWzBrXf/GaplXs
 t9hvqbNR2oIdGJGBfIcqYiH/RC6qTE0GUJpCnZPDmSEHvL49Pg8Bz7QsSuyqTa1HZzjOBmsrTbG
 EJFAxicH/vHYQkJM24W00utrutCoB9alYoMcqBNssTEy43jR2ze8SddNHjQh12Wp9Wje0dFGr9o
 +64foKoKKMnHZytyt1l/EtkaaMzAqDb7X+PyenFRGgZNJAJiw6Eqy16kvE5X+0QJtnkEUEyaOgs
 kzOoru0OBLNqdsriWwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210144


On Wed, 16 Sep 2026 18:49:19 +0200, Bartosz Golaszewski wrote:
> There's no reason to keep the SPDX license and copyright headers in the
> .md documents (README, CHANGELOG, etc.) as it only decreases their
> readability if one doesn't use any rendering tool. Move all SPDX headers
> for .md documents into REUSE.toml.
> 
> 

Applied, thanks!

[1/1] README: move SPDX boiler-plate into REUSE.toml
      https://git.kernel.org/brgl/c/64fde2647ddaa9446491543c697d26e94e03363e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
