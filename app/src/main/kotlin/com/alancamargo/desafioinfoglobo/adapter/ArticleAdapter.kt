package com.alancamargo.desafioinfoglobo.adapter

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.alancamargo.desafioinfoglobo.R
import com.alancamargo.desafioinfoglobo.model.Article
import com.squareup.picasso.Picasso

class ArticleAdapter : RecyclerView.Adapter<ArticleAdapter.ArticleHolder>() {

    private var onItemClickListener: ArticleAdapter.OnItemClickListener? = null
    private var data = listOf<Article>()

    fun setOnItemClickListener(onItemClickListener: OnItemClickListener?) {
        this.onItemClickListener = onItemClickListener
    }

    fun setData(data: List<Article>) {
        this.data = data
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ArticleHolder {
        val context = parent.context
        val inflater = LayoutInflater.from(context)
        val itemView = inflater.inflate(R.layout.item_article, parent, false)
        return ArticleHolder(itemView)
    }

    override fun onBindViewHolder(holder: ArticleHolder, position: Int) {
        val article = data[position]
        with(holder) {
            Picasso.get().load(article.images[0].url).into(imgHeadlinePhoto)
            txtSubject.text = article.section.name
            txtHeadline.text = article.headline
        }
    }

    override fun getItemCount() = data.size

    inner class ArticleHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        val imgHeadlinePhoto: ImageView = itemView.findViewById(R.id.img_headline_photo)
        val txtSubject: TextView = itemView.findViewById(R.id.txt_subject)
        val txtHeadline: TextView = itemView.findViewById(R.id.txt_headline)

        init {
            itemView.setOnClickListener {
                if (adapterPosition != RecyclerView.NO_POSITION)
                    onItemClickListener?.onItemClick(data[adapterPosition])
            }
        }
    }

    interface OnItemClickListener {
        fun onItemClick(article: Article)
    }

}