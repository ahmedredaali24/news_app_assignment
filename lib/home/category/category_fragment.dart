import 'package:flutter/material.dart';
import 'package:news_app_final/model/category.dart';
import 'package:provider/provider.dart';
import '../../providers/provider_language.dart';
import 'category_items.dart';

class CategoryFragment extends StatelessWidget {
  Function onCategoryItemClick;

  CategoryFragment({super.key, required this.onCategoryItemClick});

  // var listOfCategory = CategoryDm.getCategories(context );

  @override
  Widget build(BuildContext context) {
    var listOfCategory = CategoryDm.getCategories(context);

    var providerlan = Provider.of<ProviderLanguage>(context);

    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            providerlan.appLanguage == "en"
                ? "Pick your category \nof interest"
                : "اختر فئة اهتماماتك",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .025,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: listOfCategory.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 15),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    onCategoryItemClick(listOfCategory[index]);
                  },
                  child: CategoryItem(
                    index: index,
                    categoryDm: listOfCategory[index],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
