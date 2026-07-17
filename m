Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37EB1F7569
	for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2026 09:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784278830; cv=none; b=lTPdHPsAlchq02YVCoE01AuseXldXgaKk5+v5C8qSfM3FWm+fM0o/2ddCXD4kwWdb9kO6ZmMR1x4mG8oEu+e4UgUj9N5ocuDsXkQKjKbQUPoZ12TAf4ygdrVcljdAe/4HQfkX9srOaal1T4aM5fFL+0a9yWR7oZ+uTtORQvLglQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784278830; c=relaxed/simple;
	bh=MfSSSwmv9bJn3uIu4R3f+fVQ3600UiEgISJZDmjPsV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sSqj0RIA0LfIK+Gm7c1IYOo6HCsp5UAHc13/ruUnspg4EY/2noRRc4FTYJA+Y97h3nbRmp7cwweMUm+3T3npHgrQmCkfDFZOH9ozlRGa+OcOl3xF5nPs62Smjal0p5OREQjANNXsKuYb5V5ID0tzsDYkCfKTULM4NoSNncPe3Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pK6KTOd4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JykV/cvE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pK6KTOd4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JykV/cvE"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cG1q1065344
	for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2026 09:00:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bWiRENpWO45/PXteeh++GHCezpgOf10zH520loVkN0k=; b=pK6KTOd4yrceg3mv
	WavYZAgn+6IW1YRHh21khCAiqOUKLDPbEK6u7Q40ZUo59VtAhkK4Fl91oauwUval
	Fdt3/XhxJt+y7CL37HUXG0juLhog6mDgXLWIhatoJ69nhiUXUJklgpkRk7T9tpZJ
	oerVKWmawXtYqEhOSZqeGJ1p+etNXeIU521080G8Jc4cnxGZ3WvbgQhtzFlY0YWq
	gUS8Ul8RKv45Mnx6FHDp2HoSD2oWHc1kp1My035cAxaX+ykowKlI4KVMyl+Cfr23
	oe5eQEcjLynaH2/0lncSD7z6+99bRsWzSV9tM0UGBa9/cLg0YsFPM+W4lhtMN2Eo
	oCHAQA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffbquha17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2026 09:00:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfe3fa93bso155349041cf.2
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2026 02:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784278828; x=1784883628; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bWiRENpWO45/PXteeh++GHCezpgOf10zH520loVkN0k=;
        b=JykV/cvEXMN/L8hOzQ6uiA/9bwfwJMgf4NZ9YOsSCeXVhdVY8DiJqRwow/hxJ+Be5q
         29NSKfBhkbMOkAU0IJeS2CNeV1oDgmWKVpT0xyMU792YVnkyOHdmiyWPx/ajig+ZZLa3
         tYNvagjeaIC3ViLcqjyHDL47SDKu8AtXeYKBMPha3igSQ/Vq1bXCYd24SKixwhLBtS5d
         ikHnyBIWitWldmoIA1oepsMDehB2IlZzxYrL8Qa6VJJIlmlCnr9vb7wTF1TUKaJiDEMk
         lrPE+Zh6nbP1thcyZwxVgT7r7U6Aw6sM26h9Rt3txDM/WLnp3vYA/tiy7fQoHV6ed3n4
         srwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784278828; x=1784883628;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bWiRENpWO45/PXteeh++GHCezpgOf10zH520loVkN0k=;
        b=Tnjq/vYY7fE7vqsp+yuPSKyov45ZFnhOV6zbhco2yU4DgRU9g/1Vnt7L0d5WC1sJIU
         xuAszg7IGQr8IunUfeGAfpjw5J9/j98md++sV8g5554wRu70PsDCn2gM9UVWZ62mNB9K
         pvdur1UfO6GSfxEpxH4/ntNmfW5zh5Gfho46/h66ryKJ/Ty150/NorAUN+mclW4Zfd64
         GqUzT+jnDT13SSPcYTURpI2f7k1y3EUvbikYyqwmqGQrleUorWlMUEvFNFC96zFoQuau
         NVLHCr8d+4qk7SzjxqGskzppBphKKiH91ZrKXibSwGymyOCF3D2iW15Me+/8hN3jgxkj
         80ig==
X-Gm-Message-State: AOJu0YztWANJnPrphhbJURkrcKHMlDVp2N89etfg6+tmme5NfmoklokV
	L+0MKlVDcN/IKJg4unGwK7qfBGdT6O1AC+bYwTZzPNu8OoTy+mflcWQv9Z4a9NBHxjezi/MM4Ms
	x8bjIr9guuWNN7Ukg9h1IpN18sZ48P6Z3xAFy0iRdHcScqfYhMRmPkXA/+8zCqu1McP1Xn/3D
X-Gm-Gg: AfdE7ckucqL+0cKurzo0sK3Ml7UL/4AxIeVkibRbJNlqt77GuTU5CF9k+CADhybFptY
	NYpeF7AXZX/ZY/2M4GOSuk/Y9y480C0+ccLovBPZ7gQ9c2g0UjMZjp2a6Vveggob61FLRNhbTH9
	9NSxzJF5fsZW7h2m76/XGCi1QTnRjwvF89yJmJzj/HZ4G4rIapJTbmXzQjDWHKmfg5EkiJw5sX+
	HuqaF334kdua5RTCY6Sd3UCU15/YaDjSJJ3oBu7QyGiN50h4GK53fv7BsOw+9nOxL8vNeacEJtf
	EynHlf5zzslSimkUzXsDt5tmKMfzE9sc8iZRl92fhyrxBLUHs8yJyo6gxyujFqHcl3Wva5e+8Sl
	aavUr2PlrzjI47ske340HGQS1ECdZ
X-Received: by 2002:ac8:5842:0:b0:51c:8df2:1d65 with SMTP id d75a77b69052e-5213ea7c36cmr13085721cf.75.1784278827966;
        Fri, 17 Jul 2026 02:00:27 -0700 (PDT)
X-Received: by 2002:ac8:5842:0:b0:51c:8df2:1d65 with SMTP id d75a77b69052e-5213ea7c36cmr13085171cf.75.1784278827465;
        Fri, 17 Jul 2026 02:00:27 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:dc44:5b1b:5396:79d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a2504sm34618705e9.2.2026.07.17.02.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 02:00:26 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v1 1/1] gpio: pcf857x: Use le16_to_cpu() and cpu_to_le16() in IO accessors
Date: Fri, 17 Jul 2026 11:00:24 +0200
Message-ID: <178427882121.9609.17631798090049668312.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260715163944.1300616-1-andriy.shevchenko@linux.intel.com>
References: <20260715163944.1300616-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: b3HQegwIxRuVmdFaklHDJ9bmGL3Zod9A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4OSBTYWx0ZWRfX5SssSwPjtLJ0
 msa+VoDw69P9e7xlmcLj9wLM1qNNbmsDNIt6epJNhkG4BIYHbKO2TQI+HCsd7soGHRuGXFQDXQa
 porBCbBaiEY5jwokgcjpK85CvVlJ2/ThXtU1UBgBC//96xUCR5mwJBIPh/ildKDBDHvMYxq5fOm
 3uSX2pvrAWwU0HuneoV/X+/ajdRI+dZUuu/PpnInAn+DETYwgpRmjw8bn0gii4US4dQ7LNbgRfO
 xuKksVuULcgI83Q1kXkMROEiBxrW7XcOrWvoxq4cCkMUMgalRRttYHnj5EOBUfWk3mU1rdMz2P0
 DGgBmCdFXOa89MkuOiC/WXcH0drgqpO0GrRyyJSSfgET+bsdpu4HVqjN600h4QSo/2xEWSO3TDR
 xJFL82XfVpu0MCNgZ65h1c3HX+P9qmhLsXciddCw7al4BnZgxOwzyG8lxMwp+fvtKyB/wsPY+DS
 GqBx4EaMmMbAMd+m0WA==
X-Authority-Analysis: v=2.4 cv=NZ3WEWD4 c=1 sm=1 tr=0 ts=6a59ef2c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7DCTvsPzbH6U0NTm2kIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: b3HQegwIxRuVmdFaklHDJ9bmGL3Zod9A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4OSBTYWx0ZWRfX/EjjCjMpSRIt
 IDgpF2t57nStDqpns+kMUN3GWBKxMCB8buOoi/oAvHdk5LAiDDrq3EbMnthyoiAIDHeFz4oiRnS
 ZBVlVTRkNmnaX7JCyaHD/jwUugodpcU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170089


On Wed, 15 Jul 2026 18:39:44 +0200, Andy Shevchenko wrote:
> 16-bit expander data is an __le16, use le16_to_cpu() to read it.
> In the similar way use cpu_to_le16() to write __le16 value.
> 
> 

Applied, thanks!

[1/1] gpio: pcf857x: Use le16_to_cpu() and cpu_to_le16() in IO accessors
      https://git.kernel.org/brgl/c/fbd35c8cc6c6e817385f2bfa07fa4227370a3010

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
